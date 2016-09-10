require 'rails_helper'

describe "the delete a post path" do
  it "deletes a post" do
    category = Category.create({:name => "Beer", :id => "2"})
    visit posts_path
    click_link 'Create a New Post'
    fill_in 'Title', :with => 'This is a post'
    fill_in 'Author', :with => 'George Costanza'
    choose ("post_category_id_2")
    fill_in 'Content', :with => 'I like beer.'
    click_on 'Submit'
    click_on 'This is a post'
    click_on 'Delete Post'
    expect(page).to have_no_content('This is a post')
  end
end
