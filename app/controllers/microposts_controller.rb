class MicropostsController < ApplicationController
  def new
  	@micropost = Micropost.new
  end

  def create
  	@micropost = Micropost.new(permit_params)
  	if @micropost.save 
  		flash[:success] = "Success!"
  		redirect_to micropost_path(@micropost)
  	else
  		flash[:danger] = @micropost.errors.full_messages.first
  		redirect_to new_micropost_path
  	end
  end

  def index
  	@microposts = Micropost.all
  end

  def show
  	@micropost = Micropost.find(params[:id])
  end

  private
    def permit_params
    	params.require(:micropost).permit(:message, :email)
    end
end
