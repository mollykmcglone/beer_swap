require 'rails_helper'

describe "the add a post process" do
  it "adds a new post" do
    category = Category.create({:name => "Beer", :id => "2"})
    visit posts_path
    click_link 'Create a New Post'
    fill_in 'Title', :with => 'This is a post'
    fill_in 'Author', :with => 'Maya Angelou'
    choose ("post_category_id_2")
    fill_in 'Content', :with => 'I like beer.'
    click_on 'Submit'
    expect(page).to have_content 'This is a post'
  end
end
