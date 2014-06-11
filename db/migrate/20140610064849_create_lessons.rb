class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :category_id
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
  end
end
