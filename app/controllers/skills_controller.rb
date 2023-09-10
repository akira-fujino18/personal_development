class SkillsController < ApplicationController
  include SessionsHelper

  def index
    @user = User.find_by(id: current_user.id)
    @category = Category.find_by(id: params[:category_id])
    @skill = Skill.new
  end

  def new
    @category = Category.find(params[:category_id])
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      redirect_to skills_path(name: @skill.name, level: @skill.level, category_id: @skill.category_id, create_modal: true)
    else
      flash.now[:error] = "スキルの追加に失敗しました。"
      @category = Category.find(params[:category_id])
      render :new
    end
  end

  def skill_register
    @skill = Skill.new(skill_params)
    if @skill.save!
      redirect_to skills_path(name: @skill.name, update_modal: true)
    else
      flash.now[:error] = "スキルの保存に失敗しました。"
      render :index
    end
  end

  def update
    skill = Skill.find(params[:id])
    skill.update!(update_params)
    redirect_to skills_path( name: skill.name, update_modal: true)
  end

  def destroy
    skill = Skill.find(params[:id])
    skill.destroy
    redirect_to skills_path(name: skill.name, delete_modal: true)
  end


  private

  def skill_params
    params.require(:skill).permit(:user_id, :category_id, :level, :name)
      .merge(user_id: current_user.id, category_id: params[:skill][:category_id])
  end


end
