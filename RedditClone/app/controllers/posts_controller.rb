class PostsController < ApplicationController

  # GET /posts/1
  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  # GET /posts/new
  def new
    @post = Post.new
    render :new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to post_url(@post), notice: "Post was successfully created."
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1

  private

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :url, :content, sub_ids:[])
    end
end
