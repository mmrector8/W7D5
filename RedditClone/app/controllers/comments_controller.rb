class CommentsController < ApplicationController
  before_action :require_logged_in, only: [:new, :create, :delete]
 def new
    @comment = Comment.new
    @post_id = params[:post_id]
    render :new
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:comment][:post_id]
    @comment.author_id = current_user.id
    puts @comment.body
    puts @comment.post_id
    puts @comment.author_id
    print "#{params}\n"
    if @comment.save 
      redirect_to post_url(@comment.post_id)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new 
    end
  end


  def delete
    
  end

  private 
  def comment_params
    params.require(:comment).permit(:body)
  end
end