require 'rails_helper'

describe "the edit a profile process", vcr: true do
  it "allows a user to update their account information" do
    profile = FactoryGirl.create(:profile)
    visit posts_path
    click_on "Login"
    fill_in "Email", with: "Person@gmail.com"
    fill_in "Password", with: "password"
    click_on "Log in"
    click_on 'My Profile'
    click_on 'Account Settings'
    fill_in 'Name', :with => 'Person McPerson'
    fill_in 'Current password', :with => 'password'
    click_on 'Submit Changes'
    expect(page).to have_content 'Your account has been updated successfully'
  end
end
