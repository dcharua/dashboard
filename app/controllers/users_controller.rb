class UsersController < ApplicationController
  def new
    @user = User.new
    render :layout => "empty"
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Wellcome"
      redirect_to "/dashboards/dashboard_1"
    else
      render "new", :layout => "empty"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
