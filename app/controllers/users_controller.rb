class UsersController < ApplicationController
  def show
    @user = current_user
    @rewards = User.all.map {|user| user.rewards}
    @user_rewards = @user.rewards
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
