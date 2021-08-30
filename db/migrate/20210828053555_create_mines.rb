class CreateMines < ActiveRecord::Migration[6.1]
  def change
    create_table :mines do |t|
      t.integer :width
      t.integer :height
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
