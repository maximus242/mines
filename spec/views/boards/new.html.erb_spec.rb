require 'rails_helper'

RSpec.describe "boards/new", type: :view do
  before(:each) do
    assign(:board, Board.new(
      email: "MyString",
      width: 1,
      height: 1,
      number_of_mines: 1,
      name: "MyString"
    ))
  end

  it "renders new board form" do
    render

    assert_select "form[action=?][method=?]", boards_path, "post" do

      assert_select "input[name=?]", "board[email]"

      assert_select "input[name=?]", "board[width]"

      assert_select "input[name=?]", "board[height]"

      assert_select "input[name=?]", "board[number_of_mines]"

      assert_select "input[name=?]", "board[name]"
    end
  end
end
