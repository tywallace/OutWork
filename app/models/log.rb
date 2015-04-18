class Log < ActiveRecord::Base
  belongs_to :user

  # validates :task, presence: true, on: :create
  # validates :result, presence: true, on: :update

  def next
    Log.where("created_at > ?", created_at).where("result IS NOT NULL").order("created_at ASC").first
  end

  def prev
    Log.where("created_at < ?", created_at).where("result IS NOT NULL").order("created_at DESC").first
  end

end
