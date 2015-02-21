class Task < ActiveRecord::Base
    validates :title, presence: true, length: { maximum: 6 }
    validates :user_id, presence:true
end
