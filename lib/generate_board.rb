class GenerateBoard
  attr_reader :board, :blank_board, :number_of_mines

  LIMIT = 10.0

  def initialize(width:, height:, number_of_mines:, board:, amount: 1)
    @width, @height, @number_of_mines, @board, @amount = width, height, number_of_mines, board, amount
    calculate_jobs
    set_board
  end

  private

  def set_board
   if @number_of_mines < LIMIT
     single_record_insertions
   else
     multiple_record_insertions
   end 
  end

  def multiple_record_insertions
    @x_jobs.times do
      make_mine_job(@x)
    end

    @x_1_jobs.times do
      make_mine_job(@x + 1)
    end
  end

  def single_record_insertions
    @number_of_mines.times do
      make_mine_job(@amount)
    end
  end

  def make_mine_job(amount)
    MakeMineJob.perform_later(@width, @height, @board, amount)
  end

  def calculate_jobs
    @x = (@number_of_mines / LIMIT).floor
    z = LIMIT * @x
    a = (@x+1)*LIMIT
    b = a - @number_of_mines < LIMIT ? a - @number_of_mines : 0
    @x_jobs = (LIMIT - b).to_i
    @x_1_jobs = b.to_i
  end
end
