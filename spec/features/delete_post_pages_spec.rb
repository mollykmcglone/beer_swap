require 'rails_helper'

describe "the delete a post path" do
  it "deletes a post" do
    post= FactoryGirl.create(:post)
    visit posts_path
    click_on 'No beer for Donald Trump'
    click_on 'Delete Post'
    expect(page).to have_no_content('No beer for Donald Trump')
  end
end
