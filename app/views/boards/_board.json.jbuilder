json.extract! board, :id, :email, :width, :height, :number_of_mines, :name, :created_at, :updated_at
json.url board_url(board, format: :json)
