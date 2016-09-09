class Comment < ActiveRecord::Base
  belongs_to :post
  validates :content, :author, :presence => true

end
