class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @rewards = Reward.all
  end
end
