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
    if params[:search] != ""
        @microposts = Micropost.where("message LIKE ?", "#{params[:search]}%")
  	else 
  	    @microposts = Micropost.all
  	end
  end

  def show
  	@micropost = Micropost.find(params[:id])
  end


  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(permit_params)
      flash[:success] = "Updated"
      redirect_to micropost_path(@micropost)
    else
      flash[:danger] = @micropost.errors.full_messages.first
      redirect_to edit_micropost_path(@micropost)
    end
  end


  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.delete
    flash[:success] = "Micropost Removed"
    redirect_to root_url
  end

  private
    def permit_params
    	params.require(:micropost).permit(:message, :email)
    end
end
