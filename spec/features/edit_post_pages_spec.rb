require 'rails_helper'

describe "the edit a post process" do
  it "edits a post" do
    post = FactoryGirl.create(:post)
    visit posts_path
    click_on "Login"
    fill_in "Email", with: "Person@gmail.com"
    fill_in "Password", with: "password"
    click_on "Log in"
    click_on 'No beer for Donald Trump'
    click_on 'Edit Post'
    fill_in 'Title', :with => 'No beer for Donald Trump!!!'
    click_on 'Submit'
    expect(page).to have_content 'No beer for Donald Trump!!!'
  end

  it "won't update a post without a title" do
    post = FactoryGirl.create(:post)
    visit posts_path
    click_on "Login"
    fill_in "Email", with: "Person@gmail.com"
    fill_in "Password", with: "password"
    click_on "Log in"
    click_on 'No beer for Donald Trump'
    click_on 'Edit Post'
    fill_in 'Title', :with => ''
    click_on 'Submit'
    expect(page).to have_content "Title can't be blank"
  end
end
