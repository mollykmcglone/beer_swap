require 'rails_helper'

describe Post do
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should have_many :comments }
  it { should belong_to :category }
  it { should belong_to :user }

  describe 'default_scope' do
    it("orders posts with most recent displayed first") do
      user = FactoryGirl.create(:user)
      category = Category.create({:name => "Beer", :id => 1})
      category2 = Category.create({:name => "News", :id => 2})
      post1 = Post.create({:title => "This is a post", :content => "Here's some content.", :category_id => 1, :user_id => 1})
      post2 = Post.create({:title => "This is another post", :content => "This one has content, too!", :category_id => 2, :user_id => 1})
      expect(Post.all).to(eq([post2, post1]))
    end
  end
end
