require 'rails_helper'

RSpec.describe "boards/edit", type: :view do
  before(:each) do
    @board = assign(:board, Board.create!(
      email: "MyString",
      width: 1,
      height: 1,
      number_of_mines: 1,
      name: "MyString"
    ))
  end

  it "renders the edit board form" do
    render

    assert_select "form[action=?][method=?]", board_path(@board), "post" do

      assert_select "input[name=?]", "board[email]"

      assert_select "input[name=?]", "board[width]"

      assert_select "input[name=?]", "board[height]"

      assert_select "input[name=?]", "board[number_of_mines]"

      assert_select "input[name=?]", "board[name]"
    end
  end
end
