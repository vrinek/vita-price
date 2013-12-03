require 'spec_helper'

describe "games/show" do
  before(:each) do
    @game = assign(:game, stub_model(Game,
      :psn_price => 1,
      :amazon_price => 2,
      :title => "Title",
      :psn_id => "Psn",
      :region => "Region"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Title/)
    rendered.should match(/Psn/)
    rendered.should match(/Region/)
  end
end
