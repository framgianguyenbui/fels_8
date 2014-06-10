class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = 'Successfully created category'
      redirect_to @category
    else
      flash[:error] = 'Unsuccessfully created category'
      render :new
    end
  end

  def update
    if @category.update category_params
      flash[:success] = 'Successfully updated category'
      redirect_to @category
    else
      flash[:error] = 'Unsuccessfully updated category'
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = 'Successfully deleted category'
    redirect_to categories_url
  end

  private
    def set_category
      @category = Category.find params[:id]
    end

    def category_params
      params.require(:category).permit(:name, :description, :thumbnail, :word_limit)
    end
end
