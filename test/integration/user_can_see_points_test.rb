require 'test_helper'

class UserCanSeePointsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can see total points" do
    user = User.create
    visit user_path(user)

    assert page.has_content?("Total points: 0")
  end

  test "user can view rewards" do
    user = User.create
    visit user_path(user)

    assert page.has_content?("Available rewards")
  end
end
