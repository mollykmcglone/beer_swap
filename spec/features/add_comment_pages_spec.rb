require 'rails_helper'

describe "the add a comment process" do
  it "adds a new comment to a post" do
    post = FactoryGirl.create(:post)
    visit posts_path
    click_on "Login"
    fill_in "Email", with: "Person@gmail.com"
    fill_in "Password", with: "password"
    click_on "Log in"
    click_on "No beer for Donald Trump"
    click_on "Add a Comment"
    fill_in "Content", with: "That's ok, I'm really really rich and don't need your free beer."
    click_on "Submit"
    expect(page).to have_content "That's ok, I'm really really rich and don't need your free beer."
  end

  it "won't save a comment without any content" do
    post = FactoryGirl.create(:post)
    visit posts_path
    click_on "Login"
    fill_in "Email", with: "Person@gmail.com"
    fill_in "Password", with: "password"
    click_on "Log in"
    click_on "No beer for Donald Trump"
    click_on "Add a Comment"
    fill_in "Content", with: ""
    click_on "Submit"
    expect(page).to have_content "Oops, something went wrong!"
  end
end
