class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create, :index]

  def new
  end

  def index
    @skill = Skill.where(user_id: current_user.id)
    be_sum_level = Skill.where(user_id: current_user.id, category_id: 1).sum(:level)
    @be_level = be_sum_level
    fe_sum_level = Skill.where(user_id: current_user.id, category_id: 2).sum(:level)
    @fe_level = fe_sum_level
    inf_sum_level = Skill.where(user_id: current_user.id, category_id: 3).sum(:level)
    @inf_level = inf_sum_level
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      flash[:success] = "自己紹介文を変更しました。"
      redirect_to users_path
    else
      flash.now[:error] = "自己紹介文の変更に失敗しました。"
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
