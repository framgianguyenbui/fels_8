class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  def index
    @words = Word.all
  end

  def show
  end

  def new
    @word = Word.new
  end

  def edit
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = 'Successfully created word'
      redirect_to @word
    else
      flash[:error] = 'Unsuccessfully created word'
      render :new
    end
  end

  def update
    if @word.update word_params
      flash[:success] = 'Successfully updated word'
      redirect_to @word
    else
      flash[:error] = 'Unsuccessfully updated word'
      render :edit
    end
  end

  def destroy
    @word.destroy
    flash[:success] = 'Successfully deleted word'
    redirect_to words_url
  end

  private
    def set_word
      @word = Word.find params[:id]
    end

    def word_params
      params.require(:word).permit(:category_id, :japanese, :vietnamese, :pronoun, :answer)
    end
end
