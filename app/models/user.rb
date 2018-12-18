class User < ApplicationRecord
  has_many :from_user_friendships, class_name: "Friendship", foreign_key: "from_user_id", dependent: :destroy
  has_many :from_user, through: :from_user_friendships, source: :to_user
  has_many :to_user_friendships, class_name: "Friendship", foreign_key: "to_user_id", dependent: :destroy
  has_many :to_user, through: :to_user_friendships, source: :from_user

  has_many :from_user_messages, class_name: "Message", foreign_key: "from_user_id", dependent: :destroy
  has_many :send_user, through: :from_user_messages, source: :to_user
  has_many :to_user_messages, class_name: "Message", foreign_key: "to_user_id", dependent: :destroy
  has_many :recieved_user, through: :to_user_messages, source: :from_user

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

  def from_friend?(other_user)
		from_user.include?(other_user)
  end
  
  def to_friend?(user)
    to_user.include?(user)
  end

  def send_message?(other_user)
		send_user.include?(other_user)
  end
  
  def recieved_friend?(user)
    recieved_user.include?(user)
  end

  def send_message(other_user, room_id, content)
    from_user_messages.create!(to_user_id: other_user, room_id: room_id, content: content)
  end
end
