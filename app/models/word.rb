class Word < ActiveRecord::Base
  belongs_to :category
  has_many :word_values, dependent: :destroy
  validates :name, presence: true
  accepts_nested_attributes_for :word_values

  scope :learned_by, ->(user, category) do
    lesson_ids = "SELECT DISTINCT id
                 FROM lessons
                 WHERE category_id = #{category.id}
                 AND user_id = #{user.id}" 
    word_ids  = "SELECT DISTINCT word_id
                 FROM started_lessons
                 WHERE word_id IN (#{lesson_ids})"
    where("id IN (#{word_ids})")
  end

  scope :not_learned_by, ->(user, category) do
    lesson_ids = "SELECT DISTINCT id
                 FROM lessons
                 WHERE category_id = #{category.id}
                 AND user_id = #{user.id}" 
    word_ids  = "SELECT DISTINCT word_id
                 FROM started_lessons
                 WHERE word_id IN (#{lesson_ids})"
    where("id NOT IN (#{word_ids})")
  end
end

