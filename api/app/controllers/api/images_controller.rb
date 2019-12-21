module Api
  class ImagesController < ApplicationController
    before_action :authenticate_request

    def create
      # puts create_params
      uploaded = UploadHelper.upload(create_params)
      @current_user.picture = uploaded['url']
      @current_user.save
    end

    private

    def create_params
      params.require(:image)
    end
  end
end
