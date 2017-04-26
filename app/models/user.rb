class User < ApplicationRecord
  has_secure_password
  has_many :videos
  has_many :folders

  validates :user_name, presence: true, uniqueness: true
  validates :full_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
