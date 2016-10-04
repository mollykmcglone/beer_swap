class Beer < ActiveRecord::Base
  belongs_to :user
  belongs_to :style
  validates :name, :container_type, :description, :brew_date, :user_id, :style_id, :presence => true
  default_scope { order('created_at DESC') }
  scope :style_id, -> (style_id) { where style_id: style_id }
end
