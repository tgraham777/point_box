class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "New account created!"
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = "Invalid name and/or password!"
      render :new
    end
  end

  def show
    # byebug
    if current_user.admin?
      redirect_to admin_users_path
    else
      @user = current_user
      @rewards = User.all.map {|user| user.rewards}
      @user_rewards = @user.rewards
    end
  end

  def update
    reward = Reward.find(params[:user][:reward_id])
    if current_user.points >= reward.cost
      current_user.update(points: (current_user.points - reward.cost), redeemed: (current_user.redeemed + reward.cost))
      current_user.rewards << reward
      flash[:notice] = "You have purchased #{reward.name}"
      redirect_to user_path
    else
      flash[:errors] = "You don't have enough points to buy this reward!"
      redirect_to user_path
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
