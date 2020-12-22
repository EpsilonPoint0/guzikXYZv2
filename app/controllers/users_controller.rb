class UsersController < ApplicationController
  attr_accessor :name, :email, :password, :password_confirmation
  def new
    @user = User.new
  end

  def show
    # Find user by id
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      # display the message on the first page after the redirect
      flash[:success] = "Thank you for joining!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
    # require the user field, allow other fields. Not visible to client
  end
end
