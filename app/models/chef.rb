class Chef < ApplicationRecord
before_save { self.email = email.downcase }
validates :chefname, presence: true, length: { maximum: 16 } 
validates :email, presence: true, length: { maximum: 35 }
end