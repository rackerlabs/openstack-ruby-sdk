require 'rest-client'
require 'openssl'
require 'yaml'
require 'pry'

class Core::ServiceCatalog

  attr_accessor :id, :services, :access_token, :region

  class << self
    def load!
      info = openstack_based_auth

      if ENV['SC_STUB'] == 'true'
        auth_url = "http://127.0.0.1:7000/service_catalog"
      else
        auth_url = info[:auth_url]
      end

      body     = info[:body]
      region   = info[:region]
      headers  = { content_type: :json, accept: :json }
      response = ::RestClient.post(auth_url, body, headers)
      token    = response.headers[:x_subject_token]
      body     = JSON.parse(response.body)

      catalog = body['access']['serviceCatalog']
      sc = Core::ServiceCatalog.new(catalog, token)
      binding.pry
    end

    private

    def openstack_based_auth
      Core.logger.debug 'Loading OpenStack ServiceCatalog'

      auth_url   = ENV['OS_AUTH_URL']
      username   = ENV['OS_USERNAME']
      password   = ENV['OS_PASSWORD']
      tenant     = ENV['OS_TENANT_NAME']
      tenant_id  = ENV['OS_TENANT_ID']
      project_id = ENV['OS_PROJECT_ID']
      region     = ENV['OS_REGION_NAME']

      raise "ENV['OS_AUTH_URL'] not set" unless auth_url
      raise "ENV['OS_USERNAME'] not set" unless username
      raise "ENV['OS_PASSWORD'] not set" unless password
      raise "ENV['OS_TENANT_NAME'] not set" unless tenant
      raise "ENV['OS_TENANT_ID'] not set" unless tenant_id
      raise "ENV['OS_PROJECT_ID'] not set" unless project_id
      raise "ENV['OS_REGION_NAME'] not set" unless region

      if auth_url =~ /v3$/
        auth_url = "#{auth_url}/auth/tokens"
      end

      body = {
        "auth": {
          "identity": {
            "methods": ["password"],
            "password": {
              "user": {
                "id": "#{tenant_id}",
                "password": "#{password}"
              }
            }
          },
          "scope": {
            "project": {
              "id": "#{project_id}"
            }
          }
        }
      }

      { auth_url: auth_url, body: body.to_json, region: region }
    end
  end

  def initialize(catalog, token)
    @access_token   = token
    @region         = ENV['OS_REGION_NAME']
    @services       = catalog.map{ |s| Service.new(s) }
    Core.tenant_id  = ENV['OS_PROJECT_ID']
    Core.auth_token = token
  end

  def available_services
    names = services.map(&:name).inject([]) do |memo, rax_name|
      service = ::SERVICE_NAME_MAP.find{|k,v| v == rax_name }
      memo << service[0] if service
      memo
    end.sort

    names.map{ |name| ::SERVICE_KLASSES[name] }.compact
  end

  def url_for(our_service_name)
    service = services.find do |s|
      s.name == ::SERVICE_NAME_MAP[our_service_name]
    end

    if service
      endpoints = service.endpoints

      if endpoints.size == 1 # regionless
        endpoints.first.url
      else
        endpoints.find do |e|
          e.region == region.downcase && e.interface == "public"
        end.url
      end
    else
      raise "No service '#{our_service_name}' found"
    end
  rescue Exception => e
    raise "No #{our_service_name} endpoint for #{region}"
  end


  class Service
    attr_accessor :id, :name, :endpoints

    def initialize(hash)
      @name      = hash['name']
      @endpoints = hash['endpoints'].map{ |ep| Endpoint.new(ep) }
    end

    class Endpoint
      attr_accessor :id, :region, :url, :interface

      def initialize(hash)
        @id        = hash['id']
        @region    = hash['region'].downcase
        @url       = hash['publicURL']
        @interface = hash['interface']
      end
    end
  end

end
