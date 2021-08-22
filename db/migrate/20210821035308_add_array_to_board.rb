class AddArrayToBoard < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :array, :text
  end
end
