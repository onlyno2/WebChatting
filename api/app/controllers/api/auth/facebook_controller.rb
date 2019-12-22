module Api
  module Auth
    class FacebookController < ApplicationController
      before_action :current_user
      def login
        response = { token: JsonWebToken.encode(payload: @user.id), user_id: @user.id }
        success_response(response)
      end

      private

      def current_user
        access_token = params[:credential][:authResponse][:accessToken]
        info = AuthHelper::FacebookLogin.user_info(access_token)
        @user = User.find_by(email: info['email'])
        puts 'Create user'
        create_user(info) unless @user
      end

      def create_user(info)
        @user = User.create!(
          email: info['email'],
          password: '123456',
          password_confirmation: '123456',
          name: info['name'],
          picture: info['picture']['data']['url']
        )
      end
    end
  end
end
