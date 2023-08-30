class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session
      session[:user_id] = user.id
      flash[:success] = "ログインに成功しました。"
      redirect_to root_path
    else
      flash.now[:error] = "ログインに失敗しました。"
      render :new
    end
  end

def destroy
  session.delete(:user_id)
  flash[:success] = "ログアウトしました。"
  redirect_to login_path
end


end
