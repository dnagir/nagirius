require 'spec_helper'

describe "transactions/show.html.haml" do
  before(:each) do
    @transaction = assign(:transaction, stub_model(Transaction,
      :amount => "9.99",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Description/)
  end
end
