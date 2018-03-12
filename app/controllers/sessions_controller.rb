class SessionsController < ApplicationController
    def new

    end
    def create
        chef = Chef.find_by(email: params[:session][:email].downcase)
        if chef && chef.authenticate(params[:session][:password])
            session[:chef_id] = chef.id
            flash[:success] = "successfullly login"
            redirect_to chef
        else 
            flash.now[:danger] = "some thing wrong with this"
            render 'new'
        end


    end
    def delete
        session[:chef_id] = nil
        flash[:success] = "successfullly logout"
        redirect_to root_path

    end

end
