require "spec_helper"

describe TransactionTaggingsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/transaction_taggings" }.should route_to(:controller => "transaction_taggings", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/transaction_taggings/new" }.should route_to(:controller => "transaction_taggings", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/transaction_taggings/1" }.should route_to(:controller => "transaction_taggings", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/transaction_taggings/1/edit" }.should route_to(:controller => "transaction_taggings", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/transaction_taggings" }.should route_to(:controller => "transaction_taggings", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/transaction_taggings/1" }.should route_to(:controller => "transaction_taggings", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/transaction_taggings/1" }.should route_to(:controller => "transaction_taggings", :action => "destroy", :id => "1")
    end

  end
end
