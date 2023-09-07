class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session
      session[:user_id] = user.id
      flash[:success] = "ログインに成功しました。"
      redirect_to users_path(current_user)
    else
      flash.now[:error] = "ログインに失敗しました。メールアドレスまたはパスワードが違います。"
      render :new
    end
  end

def destroy
  session.delete(:user_id)
  flash[:success] = "ログアウトしました。"
  redirect_to login_path
end


end
