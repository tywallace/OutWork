class Goal < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :goal, presence: true, length: { maximum: 20 }
end
