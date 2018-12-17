class User < ApplicationRecord
  has_many :from_user_friendships, class_name: "Friendship", foreign_key: "from_user_id", dependent: :destroy
  has_many :from_user, through: :from_user_friendships, source: :to_user
  has_many :to_user_friendships, class_name: "Friendship", foreign_key: "to_user_id", dependent: :destroy
  has_many :to_user, through: :to_user_friendships, source: :from_user
  has_many :timelines

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }, allow_nil: true

  has_secure_password

  def friends
    from_user + to_user
  end

  def become_friend(other_user)
    from_user << other_user
  end

  def friend?(other_user)
		from_user.include?(other_user)
	end
end
