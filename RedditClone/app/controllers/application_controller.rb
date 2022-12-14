class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_logged_out
    redirect_to new_session_url if logged_in?
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    !!current_user
  end

  def logout
    current_user.reset_session_token! if logged_in?
    @current_user = nil 
    session[:session_token] = nil
  end

  def require_author_match
    redirect_to subs_url unless @post.author_id == current_user.id 
  end

  def require_moderator_match
    redirect_to subs_url unless @sub.moderator_id == current_user.id 
  end
end

