require 'rails_helper'

describe "the add a comment process" do
  it "adds a new comment to a post" do
    post = FactoryGirl.create(:post)
    visit posts_path
    click_on "No beer for Donald Trump"
    click_on "Add a Comment"
    fill_in "Author", with: "Donald"
    fill_in "Content", with: "That's ok, I'm really really rich and don't need your free beer."
    click_on "Submit"
    expect(page).to have_content "That's ok, I'm really really rich and don't need your free beer."
  end

  it "won't save a comment without an author" do
    post = FactoryGirl.create(:post)
    visit posts_path
    click_on "No beer for Donald Trump"
    click_on "Add a Comment"
    fill_in "Author", with: ""
    fill_in "Content", with: "That's ok, I'm really really rich and don't need your free beer."
    click_on "Submit"
    expect(page).to have_content "Author can't be blank"
  end
end
