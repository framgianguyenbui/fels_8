class Word < ActiveRecord::Base
  belongs_to :category

  has_many :word_values, dependent: :destroy
  has_many :started_lessons

  validates :name, presence: true

  accepts_nested_attributes_for :word_values
end
