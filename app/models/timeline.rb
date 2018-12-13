class Timeline < ApplicationRecord
  default_scope -> {order(created_at: :desc)}
  belongs_to :user, dependent: :destroy

  validates :content, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
end
