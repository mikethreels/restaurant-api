class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :delete_all
  has_many :stores, through: :reservations

  def self.save_reservation()
    user_reservations = User.includes(:reservations, :stores)
    user_reservations.all
  end
end
