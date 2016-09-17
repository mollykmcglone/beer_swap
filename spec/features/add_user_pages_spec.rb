require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    visit posts_path
    click_on "Sign Up"
    fill_in "Name", with: "Person"
    fill_in "Email", with: "Person@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
    expect(page).to have_content 'Welcome!'
  end

  it "creates a blank profile when the user is created" do
    visit posts_path
    click_on "Sign Up"
    fill_in "Name", with: "Person"
    fill_in "Email", with: "Person@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
    click_on "My Profile"
    expect(page).to have_content "Person's Profile"
  end
end
