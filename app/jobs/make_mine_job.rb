
class MakeMineJob < ApplicationJob
  queue_as :default

  def perform(width, height, board, amount = 1)
    @width, @height, @board, @amount = width, height, board, amount
    mine = nil
    while !mine do
      begin
        mine = Mine.insert_all!(mine_array)
      rescue ActiveRecord::RecordNotUnique
        mine = nil
      end
    end
  end

  def mine_array
    mine_array = Array.new(@amount) do |index|
      {width: rand(0...@width), height: rand(0...@height), board_id: @board, created_at: DateTime.now, updated_at: DateTime.now }
    end
  end
end
