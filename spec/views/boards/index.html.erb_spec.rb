require 'rails_helper'

RSpec.describe "boards/index", type: :view do
  before(:each) do
    assign(:boards, [
      Board.create!(
        email: "myemail@onestep.com",
        width: 2,
        height: 3,
        number_of_mines: 4,
        name: "Name"
      ),
      Board.create!(
        email: "myemail@onestep.com",
        width: 2,
        height: 3,
        number_of_mines: 4,
        name: "Name"
      )
    ])
  end

  it "renders a list of boards" do
    render
    assert_select "tr>td", text: "myemail@onestep.com".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
