module Auth
  class PostController < ApplicationController
    before_action :authenticate_request, only: %i[create update destroy]

    def index
      
    end
    
    def create
    
    end
    
    def update
    
    end
    
    def show
    
    end
    
    def destroy
      @current_user.posts.find_by(id: params[:id])
    end
  end
end