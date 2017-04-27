class Folder < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :videos

  validates :name, presence: { message: "~> Please name your folder." }
end
