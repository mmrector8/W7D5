class SessionsController < ApplicationController
  before_action :require_logged_in, only: [:destroy]

  def new
    @user = User.new 
    render :new
  end

  def create
    username = params[:user][:username]
    password = params[:user][:password]
    @user = User.find_by_credentials(username, password)
    if @user && @user.is_password?(password)
      login(@user)
      redirect_to users_url # change later
    else
      flash[:errors] = ["Invalid username or password"]
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end