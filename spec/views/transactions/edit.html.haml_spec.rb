require 'spec_helper'

describe "transactions/edit.html.haml" do
  before(:each) do
    @transaction = assign(:transaction, stub_model(Transaction,
      :new_record? => false,
      :amount => "9.99",
      :description => "MyString"
    ))
  end

  it "renders the edit transaction form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => transaction_path(@transaction), :method => "post" do
      assert_select "input#transaction_amount", :name => "transaction[amount]"
      assert_select "input#transaction_description", :name => "transaction[description]"
    end
  end
end
