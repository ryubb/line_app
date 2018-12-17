class Message < ApplicationRecord
  default_scope -> {order(created_at: :asc)}

  belongs_to :from_user, class_name: "User"
  belongs_to :from_user, class_name: "User"
  validates :content, presence: true, length: { maximum: 50 }
  validates :from_user_id, presence: true
  validates :to_user_id, presence: true
  validates :room_id, presence: true

  def Message.recent_in_room(room_id)
    where(room_id: room_id).last(100)
  end
end
