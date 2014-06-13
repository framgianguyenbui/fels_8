class LessonsController < ApplicationController
  before_action :signed_in_user, only: [:index, :create, :update]

  def index
    @lessons = current_user.lessons
  end

  def show
    @lesson = Lesson.find params[:id]    
  end

  def create
    category = Category.find_by_id params[:category_id]
    @lesson = current_user.lessons.create category_id: category.id, score: 0
    words = category.words.order("RANDOM()").limit category.word_limit
    words.each {|word| StartedLesson.create lesson_id: @lesson.id, word_id: word.id }
    @word = words.first
    @current_index = 0
  end

  def edit
    @lesson = Lesson.find_by_id params[:lesson_id]    
    @lesson.score = 0
    @lesson.save        
    @word = @lesson.started_lessons.first.word
    @current_index = 0
  end

  def update
    lesson_id = params[:lesson][:lesson_id]
    index = params[:lesson][:current_index]
    word_id = params[:lesson][:word_id]
    word_value_id = params[:lesson][:word_value_id]
    sl = StartedLesson.find_by lesson_id: lesson_id, word_id: word_id
    sl.word_value_id = word_value_id
    sl.save
    @lesson = Lesson.find_by_id lesson_id
    word_value = WordValue.find_by id: word_value_id
    if(word_value.correct)
      @lesson.score += 1
      @lesson.save
    end
    if index.to_i == @lesson.category.word_limit - 1
      render 'show'
    else
      words = StartedLesson.where lesson_id: lesson_id
      @word = Word.find words[index.to_i + 1].word_id
      @current_index = index.to_i + 1
      render params[:lesson][:form]
    end
  end
end
