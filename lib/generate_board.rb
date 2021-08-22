class GenerateBoard
  attr_reader :board, :blank_board, :number_of_mines
  
  def initialize(width:, height:, number_of_mines:)
    @width, @height, @number_of_mines = width, height, number_of_mines
    @mine_count = 0
    @board = Array.new(@height) { Array.new(@width) { 0 } }
    @blank_board = @board.dup
    set_board
  end

  private

  def set_board 
    mine_count = 0

    while mine_count != @number_of_mines do
      # Random Height
      height = rand(0...@height)
      # Random Width
      width = rand(0...@width)
      # Check Uniqueness
      unless board[height][width] == 1
        board[height][width] = 1
        mine_count += 1
      end
    end
  end
end
