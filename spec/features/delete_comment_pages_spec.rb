require 'rails_helper'

describe "the delete a comment process" do
  it "deletes a comment" do
    category = Category.create({:name => "Beer", :id => 2})
    post = Post.create({:title => "This is a post", :author => "George Costanza", :content => "Joy Joy", :category_id => 2, :id => 1})
    comment = Comment.create({:author => "Elaine", :content => "happy happy", :post_id => 1})
    visit post_path(post)
    click_link 'Edit Comment'
    fill_in 'Author', :with => 'Kramer'
    click_on 'Submit'
    expect(page).to_not have_content 'Elaine'
  end
end
