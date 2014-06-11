class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  validates :status, presence: true
end
