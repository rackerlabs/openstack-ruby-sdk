require 'active_support/all'
require 'sinatra/base'
require 'json'
require 'pry'

class Router
  def self.all_routes
    routes = []
    JSON.parse(File.read("./latest.json")).each do |s|
      s['resources'].each do |r|
        r["endpoints"].each do |e|
          routes << e.symbolize_keys
        end
      end
    end

    routes
      .reject{ |e| e[:path] == '/' }
      .sort_by{ |e| e[:path] }
      .uniq{ |e| e[:path] }
      .each{ |e| e[:path] = e[:path].tr('{', ':').tr('}', '') }
  end
end

class MyApp < Sinatra::Base
  set :server, :thin
  set :port, 7000
  set :bind, '0.0.0.0'
  set :logging, Logger::DEBUG
  set :mocked_routes, Router.all_routes

  before do
    content_type 'application/json'
  end

  mocked_routes.each do |hash|
    self.send hash[:method].downcase, hash[:path] do
      hash[:res]
    end
  end

  get '/' do
    content_type 'text/html'
    @all_routes = MyApp.mocked_routes
    erb :index
  end

  post '/service_catalog' do
    content_type 'application/json'
    File.read("service_catalog.json")
  end

  run! if app_file == $0
end
