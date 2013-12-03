require 'spec_helper'

describe "games/edit" do
  before(:each) do
    @game = assign(:game, stub_model(Game,
      :psn_price => 1,
      :amazon_price => 1,
      :title => "MyString",
      :psn_id => "MyString",
      :region => "MyString"
    ))
  end

  it "renders the edit game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", game_path(@game), "post" do
      assert_select "input#game_psn_price[name=?]", "game[psn_price]"
      assert_select "input#game_amazon_price[name=?]", "game[amazon_price]"
      assert_select "input#game_title[name=?]", "game[title]"
      assert_select "input#game_psn_id[name=?]", "game[psn_id]"
      assert_select "input#game_region[name=?]", "game[region]"
    end
  end
end
