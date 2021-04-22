module Monobank
  Error = Class.new(StandardError)

  class ParseError < Error
    attr_reader :data, :cause

    def initialize(multi_json_parse_exception)
      @cause = multi_json_parse_exception.cause
      @data = multi_json_parse_exception.data

      super(multi_json_parse_exception.message)
    end
  end

  class ApiError < Error
    attr_reader :http_status

    def initialize(http_status, parsed_body)
      @http_status = http_status
      super(parsed_body[:error_description])
    end
  end

  class ForbiddenError < ApiError
  end
end
