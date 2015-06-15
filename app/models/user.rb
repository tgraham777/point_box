class User < ActiveRecord::Base
  has_many :user_rewards
  has_many :rewards, through: :user_rewards

  has_secure_password
  
  validates :name, presence: true
  validates :password, presence: true

  enum role: %w(default, admin)

  def admin?
    role == "admin"
  end
end
