class Beer < ActiveRecord::Base
  belongs_to :profile
  belongs_to :style
  validates :name, :container_type, :description, :brew_date, :homebrew, :profile_id, :style_id, :presence => true

end
