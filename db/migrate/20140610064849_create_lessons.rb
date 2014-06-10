class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :category_id
      t.int :user_id
      t.string :words
      t.boolean :status

      t.timestamps
    end
  end
end
