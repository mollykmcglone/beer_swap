require 'rails_helper'

describe "the edit a comment process" do
  it "edits a comment on a post" do
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
    click_on "Edit Comment"
    fill_in "Content", with: "This country is more and more terrifying each day."
    click_on "Submit"
    expect(page).to have_content "This country is more and more terrifying each day."
  end

  it "won't update a comment without content" do
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
    click_on "Edit Comment"
    fill_in "Content", with: ""
    click_on "Submit"
    expect(page).to have_content "Content can't be blank"
  end
end
