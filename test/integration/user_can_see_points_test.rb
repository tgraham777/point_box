require 'test_helper'

class UserCanSeePointsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can see total points" do
    user = User.create
    visit user_path(user)

    assert page.has_content?("Total points: 0")
  end

  test "user can view their rewards" do
    user = User.create(name: "Ted")
    user.rewards.create(name: "ber")
    visit user_path(user)
    #reward = Reward.create(name: "reward #1")
    #byebug
    save_and_open_page
    assert page.has_content?("ber")
  end

  test "user can view available rewards" do
    user = User.create
    visit user_path(user)

    assert page.has_content?("Available rewards")
  end
end
