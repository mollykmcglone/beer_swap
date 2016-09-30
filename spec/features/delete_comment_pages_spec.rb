require 'rails_helper'

describe "the delete a comment process" do
  it "deletes a comment" do
    post = FactoryGirl.create(:post)
    visit posts_path
    click_on "Login"
    fill_in "Email", with: "Person@gmail.com"
    fill_in "Password", with: "password"
    click_on "Log in"
    click_on "Blog"
    click_on "No beer for Donald Trump"
    click_on "Add a Comment"
    fill_in "Content", with: "That's ok, I'm really really rich and don't need your free beer."
    click_on "Submit"
    click_link 'Delete Comment'
    expect(page).to_not have_content 'This country is terrifying'
  end
end
