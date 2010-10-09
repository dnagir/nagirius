require 'spec_helper'

describe "tags/edit.html.haml" do
  before(:each) do
    @tag = assign(:tag, stub_model(Tag,
      :new_record? => false,
      :name => "MyString"
    ))
  end

  it "renders the edit tag form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => tag_path(@tag), :method => "post" do
      assert_select "input#tag_name", :name => "tag[name]"
    end
  end
end
