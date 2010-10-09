class TransactionTaggingsController < ApplicationController
  # GET /transaction_taggings
  # GET /transaction_taggings.xml
  def index
    @transaction_taggings = TransactionTagging.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_taggings }
    end
  end

  # GET /transaction_taggings/1
  # GET /transaction_taggings/1.xml
  def show
    @transaction_tagging = TransactionTagging.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_tagging }
    end
  end

  # GET /transaction_taggings/new
  # GET /transaction_taggings/new.xml
  def new
    @transaction_tagging = TransactionTagging.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_tagging }
    end
  end

  # GET /transaction_taggings/1/edit
  def edit
    @transaction_tagging = TransactionTagging.find(params[:id])
  end

  # POST /transaction_taggings
  # POST /transaction_taggings.xml
  def create
    @transaction_tagging = TransactionTagging.new(params[:transaction_tagging])

    respond_to do |format|
      if @transaction_tagging.save
        format.html { redirect_to(@transaction_tagging, :notice => 'Transaction tagging was successfully created.') }
        format.xml  { render :xml => @transaction_tagging, :status => :created, :location => @transaction_tagging }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_tagging.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction_taggings/1
  # PUT /transaction_taggings/1.xml
  def update
    @transaction_tagging = TransactionTagging.find(params[:id])

    respond_to do |format|
      if @transaction_tagging.update_attributes(params[:transaction_tagging])
        format.html { redirect_to(@transaction_tagging, :notice => 'Transaction tagging was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_tagging.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction_taggings/1
  # DELETE /transaction_taggings/1.xml
  def destroy
    @transaction_tagging = TransactionTagging.find(params[:id])
    @transaction_tagging.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_taggings_url) }
      format.xml  { head :ok }
    end
  end
end
