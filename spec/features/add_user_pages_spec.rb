require 'rails_helper'

describe "the add a user process" do
  it "adds a new user and creates a blank profile for them" do
    visit posts_path
    click_on "Signup"
    fill_in "Name", with: "Person"
    fill_in "Email", with: "Person@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Submit"
    expect(page).to have_content 'Welcome! You have signed up successfully.'
    click_on "Profile"
    expect(page).to have_content "Person"
  end
end
