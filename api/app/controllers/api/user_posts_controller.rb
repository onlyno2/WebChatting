module Api
  class UserPostsController < ApplicationController
    before_action :authenticate_request, only: %i[index]
    def index
      posts = paginate @current_user.posts
      render json: serializer.new(posts, params: { user: @current_user })
    end

    private

    def serializer
      PostSerializer
    end
  end
end
