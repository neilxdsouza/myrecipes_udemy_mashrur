class ChefsController < ApplicationController

  def new
    @chef = Chef.new
  end

  def create
    #binding.pry
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "Your account has been created successfully"
      redirect_to recipes_path
    else
      render 'new'

    end
  end

  def edit
    @chef = Chef.find(params[:id])
  end

  def update
    #binding.pry
    @chef =  Chef.find(params[:id])
    if @chef.update(chef_params)
      flash[:sucess] = "Your profile has been updated successfully"
      redirect_to recipes_path # TOTO change to show chef page
    else
      render 'edit'
    end
    
  end

  private

    def chef_params
      params.require(:chef).permit(:chefname, :email, :password)
    end


end