require 'spec_helper'

describe TransactionTaggingsController do

  def mock_transaction_tagging(stubs={})
    @mock_transaction_tagging ||= mock_model(TransactionTagging, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all transaction_taggings as @transaction_taggings" do
      TransactionTagging.stub(:all) { [mock_transaction_tagging] }
      get :index
      assigns(:transaction_taggings).should eq([mock_transaction_tagging])
    end
  end

  describe "GET show" do
    it "assigns the requested transaction_tagging as @transaction_tagging" do
      TransactionTagging.stub(:find).with("37") { mock_transaction_tagging }
      get :show, :id => "37"
      assigns(:transaction_tagging).should be(mock_transaction_tagging)
    end
  end

  describe "GET new" do
    it "assigns a new transaction_tagging as @transaction_tagging" do
      TransactionTagging.stub(:new) { mock_transaction_tagging }
      get :new
      assigns(:transaction_tagging).should be(mock_transaction_tagging)
    end
  end

  describe "GET edit" do
    it "assigns the requested transaction_tagging as @transaction_tagging" do
      TransactionTagging.stub(:find).with("37") { mock_transaction_tagging }
      get :edit, :id => "37"
      assigns(:transaction_tagging).should be(mock_transaction_tagging)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created transaction_tagging as @transaction_tagging" do
        TransactionTagging.stub(:new).with({'these' => 'params'}) { mock_transaction_tagging(:save => true) }
        post :create, :transaction_tagging => {'these' => 'params'}
        assigns(:transaction_tagging).should be(mock_transaction_tagging)
      end

      it "redirects to the created transaction_tagging" do
        TransactionTagging.stub(:new) { mock_transaction_tagging(:save => true) }
        post :create, :transaction_tagging => {}
        response.should redirect_to(transaction_tagging_url(mock_transaction_tagging))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved transaction_tagging as @transaction_tagging" do
        TransactionTagging.stub(:new).with({'these' => 'params'}) { mock_transaction_tagging(:save => false) }
        post :create, :transaction_tagging => {'these' => 'params'}
        assigns(:transaction_tagging).should be(mock_transaction_tagging)
      end

      it "re-renders the 'new' template" do
        TransactionTagging.stub(:new) { mock_transaction_tagging(:save => false) }
        post :create, :transaction_tagging => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested transaction_tagging" do
        TransactionTagging.should_receive(:find).with("37") { mock_transaction_tagging }
        mock_transaction_tagging.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :transaction_tagging => {'these' => 'params'}
      end

      it "assigns the requested transaction_tagging as @transaction_tagging" do
        TransactionTagging.stub(:find) { mock_transaction_tagging(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:transaction_tagging).should be(mock_transaction_tagging)
      end

      it "redirects to the transaction_tagging" do
        TransactionTagging.stub(:find) { mock_transaction_tagging(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(transaction_tagging_url(mock_transaction_tagging))
      end
    end

    describe "with invalid params" do
      it "assigns the transaction_tagging as @transaction_tagging" do
        TransactionTagging.stub(:find) { mock_transaction_tagging(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:transaction_tagging).should be(mock_transaction_tagging)
      end

      it "re-renders the 'edit' template" do
        TransactionTagging.stub(:find) { mock_transaction_tagging(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested transaction_tagging" do
      TransactionTagging.should_receive(:find).with("37") { mock_transaction_tagging }
      mock_transaction_tagging.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the transaction_taggings list" do
      TransactionTagging.stub(:find) { mock_transaction_tagging }
      delete :destroy, :id => "1"
      response.should redirect_to(transaction_taggings_url)
    end
  end

end
