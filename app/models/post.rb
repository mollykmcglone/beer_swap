class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :category
  belongs_to :user
  validates :title, :content, :presence => true
  has_attached_file :image, :styles => { :medium => "250x250>", :large => "700x700>"}
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)

  default_scope {order('created_at DESC')}
end
