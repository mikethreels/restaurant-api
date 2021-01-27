class Store < ApplicationRecord
    has_many :reservations
    has_many :menus
    has_many :users, through: :reservations
end
