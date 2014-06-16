class Admin::WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  before_filter :signed_in_admin
  layout 'admin/layouts/admin'

  def index
    category = params[:category_id] ? Category.find(params[:category_id]) : Category.first
    @words = category.words.paginate page: params[:page], per_page: 15
  end

  def show
  end

  def new
    @word = Word.new
    4.times {
      @word.word_values.build
    }
  end

  def edit
  end

  def create
    @word = Word.new word_params
    if @word.save
      redirect_to [:admin,@word], notice: 'Word was successfully created.'
    else
      render :new
    end
  end

  def update
    if @word.update_attributes word_params
      redirect_to [:admin,@word], notice: 'Word was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @word.destroy
    redirect_to admin_words_url, notice: 'Word was successfully destroyed.'
  end

  private
    def set_word
      @word = Word.find params[:id]
    end

    def word_params
      params.require(:word).permit(:name, :category_id, word_values_attributes: [:id, :name, :correct])
    end
end
