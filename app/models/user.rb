class User < ApplicationRecord
    validates :name,{presence: true}
    validates :email,{presence: true,
                      uniqueness: true}
    validates :password,{presence: true,
                         length: {minimum: 6}}
    validates :self_introduction,{length: {maximum: 100}}
                         
    has_many :rooms,dependent: :destroy
    has_many :reservations,dependent: :destroy
  
    def reservations
      return Reservation.where(user_id: self.id)
    end
    
      has_secure_password
      
end
