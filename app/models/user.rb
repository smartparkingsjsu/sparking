class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable, :confirmable, :recoverable
         # :rememberable, :trackable, :validatable
   
   has_many :bookings, :dependent => :destroy
   has_many :notifications, foreign_key: :recipient_id
   has_many :licenseplates, :dependent => :destroy
   accepts_nested_attributes_for :licenseplates, allow_destroy: true

   # Got rid of content validation

   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "200x200#" }, :default_url => "/images/thumb.png"
   do_not_validate_attachment_file_type :avatar
end 
