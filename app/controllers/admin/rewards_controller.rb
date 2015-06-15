class Admin::RewardsController < Admin::BaseController
  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      flash[:notice] = "Reward #{@reward.name} has been created!"
      redirect_to admin_rewards_path
    else
      flash[:error] = @reward.errors.full_messages.join(", ")
    end
  end

  def index
    @rewards = Reward.all
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    @reward = Reward.find(params[:id])
    if @reward.update(reward_params)
      flash[:notice] = "Reward #{@reward.name} has been updated!"
      redirect_to admin_rewards_path
    else
      flash[:notice] = @reward.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy
    redirect_to admin_rewards_path
  end

private
  def reward_params
    params.require(:reward).permit(:name, :description)
  end
end
