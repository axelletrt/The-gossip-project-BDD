class GossipsController < ApplicationController

    def index 
        @gossips = Gossip.all 
    end 

    def new 
         @gossip = Gossip.new 
    end 
        
    def create 
        @gossip = Gossip.new 
        @gossip.title = params["gossip"][:title]
        @gossip.content = params["gossip"][:content]
        @gossip.save 
        redirect_to @gossip 
    end 


    def show 
       @gossip = Gossip.find(params[:id])
    end 

    def edit 
        @gossip = Gossip.find(params[:id])
    end 

    def update 
        @gossip = Gossip.find(params[:id])
        gossip_params = params.require(:gossip).permit(:title, :content)
        @gossip.update(gossip_params)
        redirect_to gossip_path 
    end 

    def destroy 
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
        redirect_to gossips_path
    end 

end







