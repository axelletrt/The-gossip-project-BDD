class CommentsController < ApplicationController

    def index 
        @comments = Comment.all 
    end 

    def new
        @comment = Comment.new 
    end 

    def create
        @gossip = Gossip.find(params[:gossip_id])
    
        @comment = @gossip.comments.new(comment_params)
        @comment.user_id = session[:user_id]
        @comment.save 
        redirect_to gossip_path(@gossip)
    end

      private
    def comment_params
        params.require(:comment).permit(:content)
    end

    def show
        @comment = Comment.find(id: params[:comment_id])
    end
end













