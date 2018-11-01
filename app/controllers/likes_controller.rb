class LikesController < ApplicationController

    def index 
        @likes = Like.all 
    end 

    def new
        @like = Like.new 
    end 

    def create
        @like = Like.find(params[:like_id])
        @gossip = @gossip.likes.create(like_params)
        redirect_to gossip_path(@gossip)
    end
     
      private
        def like_params
          params.require(:like).permit(:user_id, :body)
        end

    def show 
         @like = Like.find(params[:id])
    end 
    
end
