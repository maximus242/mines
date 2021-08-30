class GenerateBoard
  attr_reader :board, :blank_board, :number_of_mines

  def initialize(width:, height:, number_of_mines:, board:, amount: 1)
    @width, @height, @number_of_mines, @board, @amount = width, height, number_of_mines, board, amount
    set_board
  end

  private

  def set_board 
    number_of_jobs.times do
      MakeMineJob.perform_later(@width, @height, @board, @amount)
    end
  end

  def number_of_jobs
    @number_of_mines
  end
end
