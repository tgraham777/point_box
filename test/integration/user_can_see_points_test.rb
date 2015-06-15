require 'test_helper'

class UserCanSeePointsTest < ActionDispatch::IntegrationTest
  test "user can see total points" do
    user = User.create(name: "whocares", password: "money")

    visit login_path
    fill_in "Name", with: user.name
    fill_in "Password", with: "money"
    click_button "Login"

    assert page.has_content?("Welcome, whocares!")
    visit user_path(user)

    assert page.has_content?("Total points: 0")
  end

  test "user can view their rewards" do
    user = User.create(name: "whocares", password: "money")

    visit login_path
    fill_in "Name", with: user.name
    fill_in "Password", with: "money"
    click_button "Login"

    assert page.has_content?("Welcome, whocares!")

    user.rewards.create(name: "ber")

    visit user_path(user)
    assert page.has_content?("ber")
  end

  test "user can view available rewards" do
    user = User.create(name: "whocares", password: "money")

    visit login_path
    fill_in "Name", with: user.name
    fill_in "Password", with: "money"
    click_button "Login"

    assert page.has_content?("Welcome, whocares!")
    
    visit user_path(user)

    assert page.has_content?("Available rewards")
  end
end
