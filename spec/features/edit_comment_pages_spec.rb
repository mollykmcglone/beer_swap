require 'rails_helper'

describe "the edit a comment process" do
  it "edits a comment on a post" do
    comment = FactoryGirl.create(:comment)
    visit post_path(comment.post)
    click_on "Edit Comment"
    fill_in "Content", with: "This country is more and more terrifying each day."
    click_on "Submit"
    expect(page).to have_content "This country is more and more terrifying each day."
  end

  it "won't update a comment without content" do
    comment = FactoryGirl.create(:comment)
    visit post_path(comment.post)
    click_on "Edit Comment"
    fill_in "Content", with: ""
    click_on "Submit"
    expect(page).to have_content "Content can't be blank"
  end
end
