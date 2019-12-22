module Api
  class PostsController < ApplicationController
    before_action :authenticate_request, only: %i[create update destroy]

    def index
      posts = paginate Post.all.order('random()').includes(:likes).includes(:user), per_page: 10
      render json: serializer.new(posts)
    end

    def create
      if @current_user.posts.create(create_params)
        success_response('Create success', :ok)
      else
        error_response('Create failed', :unprocessable_entity)
      end
    end

    def update
      post = Post.find_by(id: params[:id])
      if post.update(update_params)
        success_response('Update success', :ok)
      else
        error_response('Update failed', :unprocessable_entity)
      end
    end

    def show
      post = Post.find_by(id: params[:id])
      render json: serializer.new(post)
    end

    def destroy
      post = @current_user.posts.find_by(id: params[:id])
      if post.destroy
        success_response('Delete success', :ok)
      else
        error_response('Unable to delete resource', :bad_request)
      end
    end

    private

    def serializer
      PostSerializer
    end

    def create_params
      params.permit(:title, :content)
    end

    def update_params
      params.permit(:title, :content)
    end
  end
end
