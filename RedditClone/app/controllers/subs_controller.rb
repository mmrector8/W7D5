class SubsController < ApplicationController
  # before_action :set_sub, only: %i[ show edit update destroy ]
  before_action :require_logged_in, only: [:edit, :create, :update, :new]
  
  # GET /subs
  def index
    @subs = Sub.all
  end

  # GET /subs/1
  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  # GET /subs/new
  def new
    @sub = Sub.new
  end

  # GET /subs/1/edit
  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  # POST /subs
  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subs/1
  def update
    @sub = Sub.find_by(id: params[:id])
    
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end


  private

    # Only allow a list of trusted parameters through.
    def sub_params
      params.require(:sub).permit(:title, :description)
    end
end
