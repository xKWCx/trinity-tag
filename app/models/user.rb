class User < ApplicationRecord
  devise :confirmable,
         :database_authenticatable,
         :recoverable,
         :registerable,
         :rememberable,
         :timeoutable,
         :trackable,
         :validatable
  belongs_to :organization

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, format: {
    with: /\A[\+]?[\d\s\-\(\)]{10,15}\z/,
    message: "must be a valid phone number"
  }
end
