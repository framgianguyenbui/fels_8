class CreateWordValues < ActiveRecord::Migration
  def change
    create_table :word_values do |t|
      t.integer :word_id
      t.string :name
      t.boolean :correct

      t.timestamps
    end
  end
end
