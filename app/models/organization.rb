class Organization < ApplicationRecord
  has_one_attached :logo
  has_many :users
  validates :name, presence: true
end
