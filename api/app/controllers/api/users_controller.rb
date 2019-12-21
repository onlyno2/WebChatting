module Api
  class UsersController < ApplicationController
    before_action :authenticate_request, only: %i[update destroy]
    def index
      users = paginate User.all, per_page: 10
      render json: serializer.new(users)
    end

    def show
      user = User.where(id: params[:id])
      render json: serializer.new(user)
    end

    def update
      if @current_user.update(update_param)
        success_response('Update success', :no_content)
      else
        error_response('Update failed', :unprocessable_entity)
      end
    end

    def destroy
      if @current_user.destroy
        success_response('Delete success', :no_content)
      else
        error_response('Delete failed', :unprocessable_entity)
      end
    end

    private

    def serializer
      UserSerializer
    end

    def update_param
      params.permit(:name)
    end
  end
end
