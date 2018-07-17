class User < ApplicationRecord

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

	has_many :appointments
	has_many :wineries, through: :appointments

end
