class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.integer :category_id
      t.string :japanese
      t.string :vietnamese
      t.string :pronoun
      t.string :answer

      t.timestamps
    end
  end
end
