module Monobank
  class Client
    using CoreExt::Hash
    using CoreExt::String

    attr_reader :token

    def initialize(token)
      @token = token
    end

    def currencies
      handle_response(connection.get('/bank/currency'))
    end

    def client_info
      handle_response(connection.get('/personal/client-info'))
    end

    def set_webhook(url)
      payload = MultiJson.dump(webHookUrl: url)

      handle_response(connection.post('/personal/webhook', payload))
    end

    def statements(account, from:, to: nil)
      endpoint = "/personal/statement/#{account}/#{from.to_i}"
      endpoint += "/#{to.to_i}" if to

      handle_response(connection.get(endpoint))
    end

    private

    def handle_response(response)
      parse_response(response).tap do |parsed_body|
        raise ApiError.new(response.status, parsed_body) if response.status != 200
      end
    rescue MultiJson::ParseError => exception
      raise ParseError, exception, exception.backtrace
    end

    def connection_options
      {
        url: 'https://api.monobank.ua',
        headers: { 'X-Token' => token }
      }
    end

    def connection
      @connection ||= Faraday.new(connection_options) do |faraday|
        faraday.response :logger, nil, { headers: false, bodies: true }
      end
    end

    def parse_response(response)
      MultiJson.load(response.body).deep_transform_keys { |key| key.underscore.to_sym }
    end
  end
end
