class V1::SessionsController < ApplicationController
    def create 
        user = User.where(email: params[:email]).first
        userReservations = User.getReservation(user)
        if user&.valid_password?(params[:password])
            session[:user_id] = user.id
            render json: {
                status: :created,
                logged_in: true,
                user: user.as_json(only: [:id, :email, :authentication_token], 
                include: { reservations: { include: {store: { only: [:id, :name, :location]}}, only: :date} }),
                # reservations: userReservations.as_json(include: { stores: { only: :name} })
            }
        else
            head(:unauthorized)
        end
    end

    def destroy

    end

end