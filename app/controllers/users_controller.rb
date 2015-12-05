class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(permit_params)
  	if @user.save 
  		flash[:success] = "Success!"
  		redirect_to user_path(@user)
  	else
  		flash[:danger] = @user.errors.full_messages.first
  		redirect_to new_user_path
  	end
  end

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(permit_params)
      flash[:success] = "Updated"
      redirect_to user_path(@user)
    else
      flash[:danger] = @user.errors.full_messages.first
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    flash[:success] = "User Removed"
    redirect_to root_url
  end

  private
    def permit_params
    	params.require(:user).permit(:username,:password,:email)
    end
end

