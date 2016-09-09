class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :category
  validates :title, :author, :presence => true

end
