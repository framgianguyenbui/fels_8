class StartedLesson < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
  belongs_to :word_value  
end
