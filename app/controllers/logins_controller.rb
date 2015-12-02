class LoginsController < ApplicationController

  def new

  end

  def create
    #binding.pry
    chef = Chef.find_by(email: params[:email])
    if chef && chef.authenticate(params[:password])
      # do something
      session[:chef_id]  = chef.id
      flash[:success] = "You are logged in"
      redirect_to recipes_path
    else
      # do something
      flash.now[:danger] = "Your email or password does not match"
      render 'new'
    end
  end

  def destroy
    session[:chef_id] = nil
    flash[:success] = "Logged out"
    redirect_to root_path
  end
end