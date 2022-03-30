module AuthUser
  class UserAuthentication
    SECRET_KEY = 'RTX_XFX'
    HASH_CODE = 'HS256'

    def initialize(email, user_id, role)
      @email = email
      @user_id = user_id
      @role = role
    end

    def call
      {
        token: JWT.encode(payload,SECRET_KEY,HASH_CODE),
        user: payload
      }
    end

    private

    def payload
      {
        :email=>@email,
        :user_id=>@user_id,
        :role=>@role,
        :exp=>Time.now.to_i + 12000
      }
    end

  end
end
