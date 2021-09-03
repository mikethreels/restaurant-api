class V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.save
      token = JsonWebToken.encode(@user.attributes)
      session[:user_id] = @user.id
      render :create, locals: { user: user, token: token }, status: :created
    else
      process_error(@user, 'Cannot create user')
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
