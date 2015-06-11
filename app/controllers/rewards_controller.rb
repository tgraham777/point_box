class RewardsController < ApplicationController
  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.create(reward_params)
  end

private
  def reward_params
    params.require(:reward).permit(:name)
  end
end
