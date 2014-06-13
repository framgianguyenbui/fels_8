class Lesson < ActiveRecord::Base	
  belongs_to :category
  belongs_to :user
  has_many :started_lessons  
end
