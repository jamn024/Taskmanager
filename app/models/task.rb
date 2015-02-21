class Task < ActiveRecord::Base
    belongs_to :user
    
    validates :title, presence: true, length: { maximum: 6 }
    validates :user_id, presence:true
end
