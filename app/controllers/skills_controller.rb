class SkillsController < ApplicationController
  include SessionsHelper


def index

end

def new
  @user = User.find(params[:user_id])
  @category = Category.find(params[:category_id])
  @skill = Skill.new
end

end
