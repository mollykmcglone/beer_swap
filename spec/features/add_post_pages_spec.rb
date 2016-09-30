require 'rails_helper'

describe "the add a post process" do
  it "adds a new post" do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    visit posts_path
    click_on "Login"
    fill_in "Email", with: "Person@gmail.com"
    fill_in "Password", with: "password"
    click_on "Log in"
    click_on "Blog"
    click_link 'Create New Post'
    fill_in 'Title', :with => 'This is a post'
    choose ("post_category_id_2")
    fill_in 'Content', :with => 'I like beer.'
    click_on 'Submit'
    expect(page).to have_content 'This is a post'
  end

  it "won't save a post without a title" do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    visit posts_path
    click_on "Login"
    fill_in "Email", with: "Person@gmail.com"
    fill_in "Password", with: "password"
    click_on "Log in"
    click_on "Blog"
    click_link 'Create New Post'
    fill_in 'Title', :with => ''
    choose ("post_category_id_2")
    fill_in 'Content', :with => 'I like beer.'
    click_on 'Submit'
    expect(page).to have_content "Title can't be blank"
  end

  it "doesn't let non-admin users create new posts" do
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    user.admin = false
    user.save
    visit posts_path
    click_on "Login"
    fill_in "Email", with: "Person@gmail.com"
    fill_in "Password", with: "password"
    click_on "Log in"
    click_on "Blog"
    expect(page).to_not have_content 'Create a New Post'
  end
end
