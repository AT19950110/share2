class Reservation < ApplicationRecord
    validates :start_date,{presence: true}
    validates :end_date,{presence: true}
    validates :user_id,{presence: true}
    validates :room_id,{presence: true}
    validates :total_price,{presence: true}
    validates :group,{presence: true,
                      numericality: true}
    validates :room_name,{presence: true}
    validates :room_image,{presence: true}
    
    belongs_to :user
    belongs_to :room
end
