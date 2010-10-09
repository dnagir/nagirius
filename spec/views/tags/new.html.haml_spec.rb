require 'spec_helper'

describe "tags/new.html.haml" do
  before(:each) do
    assign(:tag, stub_model(Tag,
      :new_record? => true,
      :name => "MyString"
    ))
  end

  it "renders new tag form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => tags_path, :method => "post" do
      assert_select "input#tag_name", :name => "tag[name]"
    end
  end
end
