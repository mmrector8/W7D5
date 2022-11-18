class UsersController < ApplicationController
  before_action :require_logged_out, only:[:new, :create]

  def index
    @users = User.all 
    render :index  
  end


  # GET /users/1
  def show
    @user = User.find_by(id: params[:id]) 
    render :show
  end

  # GET /users/new
  def new
    @user = User.new
    render :new
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["that didnt work"]
      # flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
