class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase # find user by email
    if user && user.authenticate(params[:session][:password]) # a user with the email exists and has the given password
    # login user
    login user # method from sessions helper
    redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  def destroy
    log_out
    redirect_to root_url
  end
end