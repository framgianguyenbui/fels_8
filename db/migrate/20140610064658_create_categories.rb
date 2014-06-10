class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.string :thumbnail
      t.integer :word_limit

      t.timestamps
    end
  end
end
