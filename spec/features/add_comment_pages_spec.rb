require 'rails_helper'

describe "the add a comment process" do
  it "adds a new comment to a post" do
    category = Category.create({:name => "Beer", :id => "2"})
    visit posts_path
    click_link 'Create a New Post'
    fill_in 'Title', :with => 'This is a post'
    fill_in 'Author', :with => 'Maya Angelou'
    choose ("post_category_id_2")
    fill_in 'Content', :with => 'I like beer.'
    click_on 'Submit'
    click_on "This is a post"
    click_on "Add a Comment"
    fill_in "Author", with: "Molly"
    fill_in "Content", with: "Nice post"
    click_on "Submit"
    expect(page).to have_content "Nice post"
  end
end
