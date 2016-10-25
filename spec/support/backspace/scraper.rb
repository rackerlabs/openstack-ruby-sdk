require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'json'
require 'ap'
require 'fileutils'
require 'sinatra/base'

regex = /(POST|PUT|DELETE|GET)\s+(\/[{|}|\/|\w|-]*)/
urls  = [
  {name: "block-storage", url: "http://developer.openstack.org/api-ref/block-storage/v3/"},
  {name: "compute", url: "http://developer.openstack.org/api-ref/compute/"},
  {name: "dns", url: "http://developer.openstack.org/api-ref/dns/"},
  {name: "identity", url: "http://developer.openstack.org/api-ref/identity/v3/"},
  {name: "image", url: "http://developer.openstack.org/api-ref/image/v2/"},
  {name: "networking", url: "http://developer.openstack.org/api-ref/networking/v2/"},
  {name: "object-storage", url: "http://developer.openstack.org/api-ref/object-storage/"},
  {name: "orchestration", url: "http://developer.openstack.org/api-ref/orchestration/v1/"}
]

services = urls.map do |u|
  puts "\nScraping #{u[:name]}"

  service_name = u[:name]
  url          = u[:url]
  doc          = Nokogiri::HTML(open(u[:url])){ |c| c.noblanks }
  resources    = doc.css(".docs-body > .section").map do |s|
    print 'R'

    name      = s.css('h1').text.tr("¶", "").strip
    endpoints = s.css('.section').each_slice(2).map do |(route_el, reqres_el)|
      next unless route_el && reqres_el
      print '.'

      text = route_el.text.tr("\n","").strip

      if (route = regex.match(text))
        method  = route[1]
        path    = route[2]
        ep_name = route_el.css('.url-subtitle').text
        ep_info = reqres_el.css('.section').each_with_object({}) do |s, all|
          section_text = s.text.strip.tr("\n", "").tr("¶", " ")
          all[:res] = {} # default

          if section_text =~ /^Response Example/
            all[:res] = JSON.parse(s.at('.highlight').text) rescue {}
          elsif section_text =~ /^Re[s]?ponse Parameters/
            all[:res_info] = section_text
          elsif section_text =~ /^Response/
            all[:res_info] = section_text
            all[:res] ||= JSON.parse(s.at('.highlight').text)
          elsif section_text =~ /^Request Example/
            all[:req] = JSON.parse(s.at('.highlight').text) rescue {}
          elsif section_text =~ /^Request/
            all[:req_info] = section_text
            all[:res] ||= JSON.parse(s.at('.highlight').text)
          elsif section_text =~ /^Success/
            all[:success_info] = section_text
          elsif section_text =~ /^Error/
            all[:error_info] = section_text
          else
            puts "Non-matching section: #{section_text[0..25]}"
          end
        end

        { method: method, path: path, name: ep_name }.merge(ep_info)
      end
    end

    { name: name, endpoints: endpoints.compact }
  end

  { name: service_name, resources: resources }
end

File.write("./latest.json", services.to_json)
