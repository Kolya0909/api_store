module AuthUser
  class UserAuthorize

    def initialize(headers = {})
      @headers = headers
    end

    def call
      user
    end

    private

    def user
      @user = User.find(decode_auth_token[:user_id]) if decode_auth_token
    end

    def decode_auth_token
      JWT.decode(http_auth_header)
    end

    def http_auth_header
      if headers['Authorization'].present?
        headers['Authorization'].split(' ').last
      else
        errors.add(:token,'Missing token')
      end
    end

  end
end