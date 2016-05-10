class Todo < ActiveRecord::Base
  belongs_to :users
  validates :item, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
end
