class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :lession_id
      t.integer :word_id
      t.string :answered

      t.timestamps
    end
  end
end
