class WordsController < ApplicationController	
  before_action :signed_in_user, only: [:index]

  def index	
    @categories = Category.all
    if params[:category_id]
      category = Category.find params[:category_id]
    else
      category = @categories.first
    end
    haslearn = params[:learned_filter]  
    user = current_user
    if haslearn && haslearn != "all" 
      if haslearn == "learned"
        @words = category.words.learned_by user, category
      else 
        @words = category.words.not_learned_by user, category 	
      end
    else 
      @words = category.words
    end	
    @words = @words.paginate page: params[:page], per_page: 15
  end	
end
