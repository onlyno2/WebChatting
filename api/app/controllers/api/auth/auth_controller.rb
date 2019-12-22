module Api
  module Auth
    class AuthController < ApplicationController
      before_action :authenticate_request, only: %i[test]

      def register
        user = User.create!(register_params)
        render json: { data: user }, status: :ok
      end

      def login
        user = User.find_by(email: auth_params[:email])
        if user
          unless user.authenticate(auth_params[:password])
            error_response('Authenticate failed', :unauthorized)
          end
          token = JsonWebToken.encode(payload: user.id)
          success_response(token)
        else
          error_response('Authenticate failed', :unauthorized)
        end
      end

      def test
        render json: 'ok', status: :ok
      end

      private

      def register_params
        params.require(:user).permit(:name, :email, :password)
      end

      def auth_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
