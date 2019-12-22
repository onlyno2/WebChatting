module Api
  class LikesController < ApplicationController
    before_action :authenticate_request, only: %i[create destroy]

    def create
      if @current_user.likes.create(create_params)
        success_response('Ok', :ok)
      else
        error_response('Like failed', :bad_request)
      end
    end

    def destroy
      if @current_user.likes.find_by(post_id: params[:id])
        success_response('Ok', :ok)
      else
        error_response('Delete failed')
      end
    end

    private

    def create_params
      params.permit(:like, :post_id)
    end
  end
end
