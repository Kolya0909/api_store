module AuthUser
  class RegenerateToken

    SECRET_KEY = 'RTX_XFX'
    HASH_CODE = 'HS256'

    def initialize(headers)
      @headers = headers
    end

    def call
      return nil unless generate_token
      generate_token
    end

    private

    def generate_token
      return unless get_user_info
      user_info = get_user_info.first
      payload = {
        :email => user_info['email'],
        :user_id => user_info['user_id'],
        :role => user_info['role'],
        :exp => Time.now.to_i + 12000
      }
      JWT.encode payload, SECRET_KEY, HASH_CODE
    end

    def get_user_info
      return unless jwt_user_token

      begin

        JWT.decode jwt_user_token, SECRET_KEY

      rescue JWT::ExpiredSignature
      rescue JWT::VerificationError
      rescue JWT::DecodeError
      end

    end

    def jwt_user_token
      if @headers['Authorization'].present?
         @headers['Authorization'].split(' ').last
      else
        nil
      end
    end

  end
end