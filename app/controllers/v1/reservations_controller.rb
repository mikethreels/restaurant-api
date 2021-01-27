class V1::ReservationsController < ApplicationController
    def create 
        @reservation = Reservation.new(reservation_params)
        
        @reservation.save
        render json: @reservation, status: :created
    end

    private

    def reservation_params
        params.require(:reservation).permit(:date, :confirmed, :user_id, :store_id)
    end
end