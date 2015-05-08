class Goal < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :number, presence: true
  validates :content, length: { maximum: 25 }
end
