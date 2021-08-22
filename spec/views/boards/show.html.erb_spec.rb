require 'rails_helper'

RSpec.describe "boards/show", type: :view do
  before(:each) do
    @board = assign(:board, Board.create!(
      email: "Email",
      width: 2,
      height: 3,
      number_of_mines: 4,
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Name/)
  end
end
