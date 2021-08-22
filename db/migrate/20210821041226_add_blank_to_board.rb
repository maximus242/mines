class AddBlankToBoard < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :blank, :text
  end
end
