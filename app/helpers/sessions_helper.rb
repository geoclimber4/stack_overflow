helpers do

  def current_user
      @current_user ||= User.find_by(id: session[:id])
  end

  def logged_in?
    !!current_user
  end

  def authenticate!
    redirect '/questions' unless logged_in?
  end
end
