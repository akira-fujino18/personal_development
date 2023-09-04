class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create, :index]

  def new
  end

  def index
    @skill = Skill.where(user_id: current_user.id)
    @be_level = Skill.where(user_id: current_user.id, category_id: 1).maximum(:level)
    @fe_level = Skill.where(user_id: current_user.id, category_id: 2).maximum(:level)
    @inf_level = Skill.where(user_id: current_user.id, category_id: 3).maximum(:level)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update!(user_params)
      flash[:success] = "自己紹介文を変更しました。"
      redirect_to users_path
    else
      flash.now[:alert] = "自己紹介文の変更に失敗しました。"
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :self_introduction, :password_digest, :image)
  end
end
