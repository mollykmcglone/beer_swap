require 'rails_helper'

describe "the delete a post path" do
  it "deletes a post" do
    post= FactoryGirl.create(:post)
    visit posts_path
    click_on "Login"
    fill_in "Email", with: "Person@gmail.com"
    fill_in "Password", with: "password"
    click_on "Log in"
    click_on 'No beer for Donald Trump'
    click_on 'Delete Post'
    expect(page).to have_no_content('No beer for Donald Trump')
  end
end
