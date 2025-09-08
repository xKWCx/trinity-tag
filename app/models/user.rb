class User < ApplicationRecord
  devise :database_authenticatable,
         :invitable,
         :lockable,
         :recoverable,
         :rememberable,
         :timeoutable,
         :trackable,
         :validatable
  belongs_to :organization

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
  validates :phone, format: {
    with: /\A[\+]?[\d\s\-\(\)]{10,15}\z/,
    message: "must be a valid phone number"
  }, allow_blank: true
  enum :role, { user: 0, owner: 1 }
end
