require 'test_helper'

class UserCanLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    user = User.create(name: "tyler", password: "password")

    visit login_path
    fill_in "Name", with: user.name
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome, tyler!")
  end

  test "unregistered user cannot login" do
    visit login_path
    fill_in "Name", with: "jerry"
    fill_in "Password", with: "password"
    click_button "Login"

    refute page.has_content?("Welcome, jerry!")
  end

  test "user cannot login with incorrect name" do
    user = User.create(name: "tyler", password: "password")

    visit login_path
    fill_in "Name", with: "jerry"
    fill_in "Password", with: "password"
    click_button "Login"

    refute page.has_content?("Welcome, jerry!")
    refute page.has_content?("Welcome, tyler!")
  end

  test "user cannot login with incorrect password" do
    user = User.create(name: "tyler", password: "password")

    visit login_path
    fill_in "Name", with: "tyler"
    fill_in "Password", with: "password2"
    click_button "Login"

    refute page.has_content?("Welcome, tyler!")
  end
end
