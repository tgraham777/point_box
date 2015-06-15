require 'test_helper'

class UserCanLogoutTest < ActionDispatch::IntegrationTest
  test "user can logout" do
    user = User.create(name: "tyler", password: "password")

    visit login_path
    fill_in "Name", with: user.name
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome, tyler!")

    click_link "Logout"

    refute page.has_content?("Welcome, tyler!")
  end
end
