class UsersController < ApplicationController
  attr_accessor :name, :email, :password, :password_confirmation
  def new
  end

  def show
    # Find user by id
    @user = User.find(params[:id])
  end
end
