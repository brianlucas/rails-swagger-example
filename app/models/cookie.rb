class Cookie < ActiveRecord::Base
  belongs_to :monster
  validates :price, :cookie_type, presence: true
end
