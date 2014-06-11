class CreateStartedLessons < ActiveRecord::Migration
  def change
    create_table :started_lessons do |t|
      t.integer :lesson_id
      t.integer :word_id
      t.integer :word_value_id

      t.timestamps
    end
  end
end
