class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile, :update_only => true
  has_many :comments
  has_many :posts
  has_many :beers, dependent: :destroy
  after_create :create_profile
  acts_as_messageable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end
end
