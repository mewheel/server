class AuthController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      render json: authentication_payload(@user)
    else
      render json: { errors: ['Invalid username or password'] }, status: :unauthorized
    end
  end

  def signup
    signup_params = params.require(:user).permit(:email, :password, :password_confirmation)
    print signup_params
    @user = User.new(signup_params)
    if @user.save
      render json: authentication_payload(@user)
    else
      render json: @user, status: :bad_request
    end
  end

  private

  def authentication_payload(user)
    return nil unless user && user.id
    {
        auth_token: AuthToken.encode({ user_id: user.id }),
        user: { id: user.id, email: user.email } # return whatever user info you need
    }
  end
end