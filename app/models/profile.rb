class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :beers, dependent: :destroy
  has_attached_file :avatar, :styles => { :medium => "200x200#", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => %w(image/jpeg image/jpg image/png)
  before_validation :create_full_address
  geocoded_by :full_address
  after_validation :geocode, :if => :address_changed?


private
  def create_full_address
    self.full_address = [address, city, state, zipcode].compact.join(', ')
  end
end
