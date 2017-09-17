class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :rememberable, :registerable
         # :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :bookings      
end
