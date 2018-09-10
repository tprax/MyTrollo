class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.text :todo
      t.belongs_to :board, foreign_key: true

      t.timestamps
    end
  end
end
