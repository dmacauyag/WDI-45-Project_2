class User < ApplicationRecord
  has_secure_password
  has_many :videos
  has_many :folders

  validates :user_name, presence: true
  validates :full_name, presence: true
  validates :email, presence: true
  validates :password, presence: true 
end
