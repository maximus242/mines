class IndexBoardIdHeightWidth < ActiveRecord::Migration[6.1]
  def change
    add_index :mines, [ :board_id, :height, :width ], :unique => true
  end
end
