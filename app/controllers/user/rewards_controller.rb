class User::RewardsController < User::BaseController
  def index
    @rewards = Reward.all
  end

  def show
    @reward = Reward.find(params[:id])
  end
end
