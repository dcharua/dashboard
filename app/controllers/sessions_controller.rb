class SessionsController < ApplicationController

  def new
    render :layout => "empty"
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to dashboards_dashboard_1_path(user)

    else
      flash.now[:danger] = "Email and password do not match, try again!"
      render "new", :layout => "empty"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You logged out"
    redirect_to root_path
  end
end
