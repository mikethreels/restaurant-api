class V1::UsersController < ApplicationController
  include ActionController::HttpAuthentication::Token
  def create
    @user = User.create(user_params)
    if @user.save
      token = AuthenticationTokenService.encode(@user)
      session[:user_id] = @user.id
      render json: {
        loggedIn: true,
        username: @user.email,
        token: token
      }, status: :created
    else
      process_error(@user, 'Cannot create user')
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
