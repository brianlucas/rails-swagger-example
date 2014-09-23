class Monster < ActiveRecord::Base
  has_many :cookies, :class_name => Cookie
  validates :first_name, :last_name, :email, :role, :color, presence: true
end
