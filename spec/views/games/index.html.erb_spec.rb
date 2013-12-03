require 'spec_helper'

describe "games/index" do
  before(:each) do
    assign(:games, [
      stub_model(Game,
        :psn_price => 1,
        :amazon_price => 2,
        :title => "Title",
        :psn_id => "Psn",
        :region => "Region"
      ),
      stub_model(Game,
        :psn_price => 1,
        :amazon_price => 2,
        :title => "Title",
        :psn_id => "Psn",
        :region => "Region"
      )
    ])
  end

  it "renders a list of games" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Psn".to_s, :count => 2
    assert_select "tr>td", :text => "Region".to_s, :count => 2
  end
end
