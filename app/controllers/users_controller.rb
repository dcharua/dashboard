class UsersController < ApplicationController
  def new
    @user = User.new
    render :layout => "empty"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Wellcome"
      redirect_to root_path

    else
      redirect_to :back
      flash[:error] = "Error"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
