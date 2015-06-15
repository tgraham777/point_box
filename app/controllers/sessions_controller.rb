class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = "Incorrect login."
      redirect_to new_user_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
