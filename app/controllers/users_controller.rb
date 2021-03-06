class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    invalid = 'Username already exists or password invalid.'
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      flash[:name] = invalid
      flash[:password] = invalid
      flash[:password_confirmation] = invalid
      redirect_to login_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end