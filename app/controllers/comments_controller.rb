class CommentsController < ApplicationController

    def index 
        @comments = Comment.all 
    end 

    def new
        @comment = Comment.new 
    end 

     def create
        @gossip = Gossip.find(params[:gossip_id])
        @comment = @gossip.comments.create(comment_params)
        redirect_to gossip_path(@gossip)
      end
     
      private
        def comment_params
          params.require(:comment).permit(:user_id, :body)
        end

    def show 
         @comment = Comment.find(params[:id])
    end 

end








