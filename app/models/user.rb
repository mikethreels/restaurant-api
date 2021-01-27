class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :reservations
  has_many :stores, through: :reservations

  def self.getReservation(user)
    userReservations = User.includes(:reservations, :stores)
    userReservations.all
  end

  
end
