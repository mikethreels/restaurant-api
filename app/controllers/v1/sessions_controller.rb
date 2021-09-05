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
      }
    else
      json_response(:unauthorized)
    end
  end

  def destroy; end
end
