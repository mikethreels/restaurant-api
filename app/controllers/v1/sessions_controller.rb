class V1::SessionsController < ApplicationController

  def create
    user = User.where(email: params[:email]).first
    if user&.valid_password?(params[:password])
      session[:user_id] = user.id
      render json: {
        logged_in: true,
        user: user.as_json(only: %i[id email authentication_token],
                           include: { reservations: { include: { store: { only: %i[id
                                                                                   name
                                                                                   location] } }, only: :date } })
        # reservations: userReservations.as_json(include: { stores: { only: :name} })
      }
    else
      head(:unauthorized)
    end
    # user = User
    #         .find_by(email: params["email"])
    # if user&.valid_password?(params[:password])
    #   session[:user_id] = user.id
    #   render json: {
    #     status: :created,
    #     logged_in: true,
    #     user: user.as_json(only: %i[id email authentication_token],
    #                        include: { reservations: { include: { store: { only: %i[id
    #                                                                                name
    #                                                                                location] } }, only: :date } })
    #     # reservations: userReservations.as_json(include: { stores: { only: :name} })
    #   }
    # else
    #   head(:unauthorized)
    # end
  end

  def destroy; end
end
