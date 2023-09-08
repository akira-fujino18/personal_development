class UsersController < ApplicationController
  include SessionsHelper
  before_action :set_user, except: [:new, :create, :index]

  def new
  end

  def index
# 今月の開始日と終了日
current_month_start = Date.today.beginning_of_month
current_month_end = Date.today.end_of_month

# 1ヶ月前の開始日と終了日
one_month_ago_start = 1.month.ago.beginning_of_month
one_month_ago_end = 1.month.ago.end_of_month

# 2ヶ月前の開始日と終了日
two_months_ago_start = 2.months.ago.beginning_of_month
two_months_ago_end = 2.months.ago.end_of_month

@current_month_data_be = Skill.where(user_id: current_user.id, category_id: 1)
                              .where("updated_at >= ? AND updated_at <= ?", current_month_start, current_month_end)
                              .sum(:level)

@one_month_ago_data_be = Skill.where(user_id: current_user.id, category_id: 1)
                              .where("updated_at >= ? AND updated_at <= ?", one_month_ago_start, one_month_ago_end)
                              .sum(:level)

@two_months_ago_data_be = Skill.where(user_id: current_user.id, category_id: 1)
                              .where("updated_at >= ? AND updated_at <= ?", two_months_ago_start, two_months_ago_end)
                              .sum(:level)

@current_month_data_fe = Skill.where(user_id: current_user.id, category_id: 2)
                              .where("updated_at >= ? AND updated_at <= ?", current_month_start, current_month_end)
                              .sum(:level)

@one_month_ago_data_fe = Skill.where(user_id: current_user.id, category_id: 2)
                              .where("updated_at >= ? AND updated_at <= ?", one_month_ago_start, one_month_ago_end)
                              .sum(:level)

@two_months_ago_data_fe = Skill.where(user_id: current_user.id, category_id: 2)
                              .where("updated_at >= ? AND updated_at <= ?", two_months_ago_start, two_months_ago_end)
                              .sum(:level)

@current_month_data_inf = Skill.where(user_id: current_user.id, category_id: 3)
                              .where("updated_at >= ? AND updated_at <= ?", current_month_start, current_month_end)
                              .sum(:level)

@one_month_ago_data_inf = Skill.where(user_id: current_user.id, category_id: 3)
                              .where("updated_at >= ? AND updated_at <= ?", one_month_ago_start, one_month_ago_end)
                              .sum(:level)

@two_months_ago_data_inf = Skill.where(user_id: current_user.id, category_id: 3)
                              .where("updated_at >= ? AND updated_at <= ?", two_months_ago_start, two_months_ago_end)
                              .sum(:level)
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
