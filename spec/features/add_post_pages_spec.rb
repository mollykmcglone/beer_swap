require 'rails_helper'

describe "the add a post process" do
  it "adds a new post" do
    category = FactoryGirl.create(:category)
    visit posts_path
    click_link 'Create a New Post'
    fill_in 'Title', :with => 'This is a post'
    fill_in 'Author', :with => 'Maya Angelou'
    choose ("post_category_id_2")
    fill_in 'Content', :with => 'I like beer.'
    click_on 'Submit'
    expect(page).to have_content 'This is a post'
  end

  it "won't save a post without a title" do
    category = FactoryGirl.create(:category)
    visit posts_path
    click_link 'Create a New Post'
    fill_in 'Title', :with => ''
    fill_in 'Author', :with => 'Jimbob'
    choose ("post_category_id_2")
    fill_in 'Content', :with => 'I like beer.'
    click_on 'Submit'
    expect(page).to have_content "Title can't be blank"
  end
end
