require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  test 'user can create account' do
    visit new_user_path
    fill_in "Name", with: "tyler"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, tyler!")
  end

  test 'user cannot create account with no name' do
    visit new_user_path
    fill_in "Name", with: ""
    fill_in "Password", with: "password"
    click_button "Create Account"

    refute page.has_content?("Welcome")
  end

  test 'user cannot create account with no password' do
    visit new_user_path
    fill_in "Name", with: "tyler"
    fill_in "Password", with: ""
    click_button "Create Account"

    refute page.has_content?("Welcome")
  end
end
