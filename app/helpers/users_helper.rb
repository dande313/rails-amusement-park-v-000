module UsersHelper

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def set_session(user)
    session[:user_id] = user.id
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def authenticate_user
    redirect_to '/' if !logged_in?
  end

  def authenticate_admin
    redirect_to '/' if !logged_in? && !current_user.admin
  end

  def user_params
    params.require(:user).permit(:name, :password, :height, :tickets, :happiness, :nausea, :admin )
  end
end
