class User < ApplicationRecord
  has_secure_password
  has_many :videos
  has_many :folders

  validates :user_name, presence: { message: "~> Please provide a username." }
  validates :user_name, uniqueness: { message: "~> That username is already taken." }

  validates :full_name, presence: { message: "~> Please provide your name." }

  validates :email, presence: { message: "~> Please provide your email address." }
  validates :email, uniqueness: { message: "~> That email address is already taken." }

  validates :password, presence: true
end
