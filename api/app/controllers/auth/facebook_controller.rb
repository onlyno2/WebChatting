module Auth
  class FacebookController < ApplicationController
    before_action :current_user
    def login
      token = JsonWebToken.encode(payload: @user.id)
      success_response(token)
    end

    private

    def current_user
      access_token = params[:credential][:authResponse][:accessToken]
      info = AuthHelper::FacebookLogin.user_info(access_token)
      @user = User.find_by(email: info['email'])
      create_user(info) unless @user
    end

    def create_user(info)
      @user = User.create!(
        email: info['email'],
        password: Faker::Lorem.word,
        password_confirmation: Faker::Lorem.word,
        name: info['name'],
        picture: info['picture']['data']['url']
      )
    end
  end
end
