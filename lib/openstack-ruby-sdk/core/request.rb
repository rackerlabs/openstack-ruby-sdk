require 'json'
require 'rest-client'

class Core::Request
  class << self
    def get(url)
      request! do
        Core.logger.debug "GET: #{url}"
        response = RestClient.get(url, headers)
        Core.logger.debug response
        response
      end
    end

    def post(url, data)
      request! do
        Core.logger.debug "POST: #{url}: #{data.to_json}"
        response = RestClient.post(url, data.to_json, headers)
        Core.logger.debug response
        response
      end
    end

    def put(url, data)
      request! do
        Core.logger.debug "PUT: #{url}: #{data.to_json}"
        response = RestClient.put(url, data.to_json, headers)
        Core.logger.debug response
        response
      end
    end

    def delete(url)
      request! do
        Core.logger.debug "DELETE: #{url}"
        response = RestClient.delete(url, headers)
        Core.logger.debug response
        response
      end
    end

    private

    def request!(&block)
      response = block.call
      response == "" ? true : JSON.parse(response)
    rescue JSON::ParserError => e
      raise Core::BadRequest.new(e)
    rescue RestClient::Conflict => e
      raise Core::BadRequest.new(e.response)
    rescue RestClient::BadRequest => e
      raise Core::BadRequest.new(e.response)
    end

    def headers
      Core::ServiceCatalog.load! unless Core.auth_token
      { "X-Auth-Token": Core.auth_token, content_type: :json, accept: :json }
    end
  end
end
