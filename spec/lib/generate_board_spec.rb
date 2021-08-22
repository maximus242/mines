# frozen_string_literal: true

require_relative "../../lib/generate_board"

RSpec.describe GenerateBoard do
  context "a new request to generate a board is created" do
    it "generates the board with the correct width for the first sub-array" do
      board_width = 4
      generator = described_class.new(width: board_width, height: rand(1..100), number_of_mines: rand(1..4))

      width = generator.board.first.length 

      expect(width).to eq board_width
    end

    it "has all the sub-arrays of the same width" do
      # Make the width and height at least 25x25 so the random number of mines is not less than the board size
      generator = described_class.new(width: rand(5..100), height: rand(5..100), number_of_mines: rand(1...25))
      width = generator.board.first.length 

      sub_arrays_are_same_width = generator.board.all? { |sub_array| sub_array.length == width }

      expect(sub_arrays_are_same_width).to be true
    end

    it "generates the board with the correct height for the first sub-array" do
      board_height = rand(4..100) 
      generator = described_class.new(width: rand(1..100), height: board_height, number_of_mines: rand(1..4))

      height = generator.board.length 

      expect(height).to eq board_height 
    end

    it "generates the correct number of mines" do
      generator = described_class.new(width: rand(5..100), height: rand(5..100), number_of_mines: rand(1...25))
      requested_number_of_mines = generator.number_of_mines

      actual_number_of_mines = generator.board.sum(&:sum)

      expect(actual_number_of_mines).to be requested_number_of_mines
    end
  end
end
