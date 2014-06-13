class WordValue < ActiveRecord::Base
  belongs_to :word
  belongs_to :started_lesson
  validates :name, presence: true
end
