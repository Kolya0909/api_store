module AuthUser
  class UserAuthentication
    SECRET_KEY = 'azor'
    HASH_CODE = 'HS256'

    def initialize(email, user_id, role)
      @email = email
      @user_id = user_id
      @role = role
    end

    def call
      JWT.encode(payload,SECRET_KEY,HASH_CODE)
    end

    private

    def payload
      {
        :email=>@email,
        :user_id=>@user_id,
        :role=>@role
      }
    end

  end
end
