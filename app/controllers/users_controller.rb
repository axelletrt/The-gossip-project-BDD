class UsersController < ApplicationController

    def home
    end

    def login 
        
    end 

    def new
        @user= User.new
    end

	def create
        user = params[:user]
        @user = User.create(name: user[:name], email: user[:email], password: user[:password])
        flash[:info] = "Bienvenue #{@user.name} !"
        redirect_to gossips_path
	end

	def check
	    user = params
	    @current_user = User.where(name: user[:name], password: user[:password]).first
        if @current_user
            session[:user_id] = @current_user.id
        flash[:info] = "Bienvenue #{@current_user.name} !"
        redirect_to gossips_path 
        else
                session[:user_id] = nil 
        flash[:info] = "Échec de la connexion,veuillez réessayer de se connecter"
        redirect_to "/users/login"
        end
    end
end






