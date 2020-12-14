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
    @user = User.new(params[:user]) # Not the final implementation!
    if @user.save
      # Handle a successful save.
    else
      render 'new'
    end
  end
end
