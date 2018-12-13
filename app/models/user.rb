class User < ApplicationRecord
  has_many :timelines

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }

  has_secure_password
end
