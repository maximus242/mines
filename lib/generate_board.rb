class GenerateBoard
  def initialize(width:, height:, number_of_mines:)
    @width, @height, @number_of_mines = width, height, number_of_mines
  end

  def board
    Array.new(@height) { Array.new(@width) { rand(3) } }
  end
end
