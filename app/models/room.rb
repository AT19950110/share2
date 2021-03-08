class Room < ApplicationRecord
    validates :room_name,{presence: true}
    validates :adress,{presence: true}
    validates :price,{presence: true}
    validates :user_id,{presence: true}
    validates :introduction,{length: {maximum: 100}}
    
  belongs_to :user
  has_many :reservations,dependent: :destroy
   
    def reservations
      return Reservation.where(room_id: self.id)
    end

   
   def self.search(adress,search)
      if adress
        @rooms = Room.where(["adress LIKE ?", "%#{adress}%"])
      elsif search
        @rooms = Room.where(["adress LIKE ? OR room_name LIKE ?","%#{search}%","%#{search}%"])
      else
        @rooms = Room.all
      end
   end

   
end
