require 'rails_helper'

describe "the add a beer process", js: true, vcr: true do
  it "allows a user to post a new beer for sharing" do
    profile = FactoryGirl.create(:profile)
    style = FactoryGirl.create(:style)
    visit posts_path
    click_on "Login"
    fill_in "Email", with: "Person@gmail.com"
    fill_in "Password", with: "password"
    click_on "Log in"
    click_on "My Profile"
    click_on "Share a new beer"
    fill_in "Name", with: "Outrageous Oatmeal Stout"
    fill_in "beer[abv]", with: 7.5
    select('Porter/Stout', :from => 'beer[style_id]')
    select('22 oz. bottles', :from => 'beer[container_type]')
    fill_in "Brew date", with: "2016-06-13"
    fill_in "beer[brewery_name]", with: "Rogue"
    fill_in "Description", with: "This turned out really well! Creamy and not-too-sweet."
    click_on "Submit"
    expect(page).to have_content "Outrageous Oatmeal Stout"
  end

  it "won't save a beer without a name" do
    profile = FactoryGirl.create(:profile)
    style = FactoryGirl.create(:style)
    visit posts_path
    click_on "Login"
    fill_in "Email", with: "Person@gmail.com"
    fill_in "Password", with: "password"
    click_on "Log in"
    click_on "My Profile"
    click_on "Share a new beer"
    fill_in "Name", with: ""
    fill_in "beer[abv]", with: 7.5
    select('Porter/Stout', :from => 'beer[style_id]')
    select('22 oz. bottles', :from => 'beer[container_type]')
    fill_in "Brew date", with: "2016-06-13"
    fill_in "beer[brewery_name]", with: "Rogue"
    fill_in "Description", with: "This turned out really well! Creamy and not-too-sweet."
    click_on "Submit"
    expect(page).to have_content "Oops, something went wrong!"
  end
end
