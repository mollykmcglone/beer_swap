require 'rails_helper'

describe "the delete a comment process" do
  it "deletes a comment" do
    comment = FactoryGirl.create(:comment)
    visit post_path(comment.post)
    click_link 'Delete Comment'
    expect(page).to_not have_content 'This country is terrifying'
  end
end
