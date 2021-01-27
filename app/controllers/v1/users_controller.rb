class V1::UsersController < ApplicationController
  def create
    user = User.create!(
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation']
    )

    if @user
      sessions[:user_id] = @user.id
      render json: {
        status: :created,
        user: @user
      }
    else
      render json: { status: 500 }
    end
    # @user = User.new(user_params)
    # puts @user
    # if @user.save
    #     render :create
    # else
    #     head(:unprocessable_entity)
    # end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
