require 'rails_helper'

describe "the edit a comment process" do
  it "edits a comment on a post" do
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
    click_on "Edit Comment"
    fill_in "Content", with: "Actually, I don't like this post"
    click_on "Submit"
    expect(page).to have_content "Actually, I don't like this post"
  end
end
