class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @rewards = User.all.map {|user| user.rewards}
    @user_rewards = @user.rewards
  end
end
