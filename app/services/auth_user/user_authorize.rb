module AuthUser
  class UserAuthorize
    SECRET_KEY = 'RTX_XFX'
    def initialize(headers = {})
      @headers = headers
    end

    def call
      user_info
    end

    private

    attr_reader :headers

    def user_info
      decoded_auth_token  if decoded_auth_token
    end

    def decoded_auth_token
      begin
        JWT.decode(http_auth_header, SECRET_KEY ) if http_auth_header
      rescue JWT::ExpiredSignature
      rescue JWT::VerificationError
      rescue JWT::DecodeError
      end

    end

    def http_auth_header
      if headers['Authorization'].present?
        return headers['Authorization'].split(' ').last
      end
        nil
      end
  end
end