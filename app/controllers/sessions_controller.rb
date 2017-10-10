class SessionsController < ApplicationController

  def new
    if !logged_in?
      render 'new'
    else
      redirect_to "/users/#{current_user.id}"
    end
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      set_session(@user)
      redirect_to "/users/#{current_user.id}"
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
