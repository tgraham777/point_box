class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :password, presence: true

  has_many :user_rewards
  has_many :rewards, through: :user_rewards
end
