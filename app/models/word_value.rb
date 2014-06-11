class WordValue < ActiveRecord::Base
  belongs_to :word

  has_many :started_lessons

  validates :name, presence: true
end
