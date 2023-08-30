class CategoriesController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
  end

  def create
  end


end
