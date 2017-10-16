class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable, :validatable
         # :recoverable, :rememberable, :trackable, :confirmable
   
   has_many :bookings, :dependent => :destroy
   has_many :notifications, foreign_key: :recipient_id
   has_many :licenseplates, :dependent => :destroy
end
