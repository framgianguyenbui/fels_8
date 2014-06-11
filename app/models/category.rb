class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy

  validates :name, presence: true, length: {minimum: 6}
  validates :description, length: {maximum: 500}

  before_save {|category| category.word_limit = word_limit>20 ? word_limit : 20 }
end
