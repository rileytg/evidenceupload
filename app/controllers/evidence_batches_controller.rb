class EvidenceBatchesController < ApplicationController
  # GET /evidence_batches
  # GET /evidence_batches.json
  def index
    @evidence_batches = EvidenceBatch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @evidence_batches }
    end
  end

  # GET /evidence_batches/1
  # GET /evidence_batches/1.json
  def show
    @evidence_batch = EvidenceBatch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evidence_batch }
    end
  end

  # GET /evidence_batches/new
  # GET /evidence_batches/new.json
  def new
    @evidence_batch = EvidenceBatch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evidence_batch }
    end
  end

  # GET /evidence_batches/1/edit
  def edit
    @evidence_batch = EvidenceBatch.find(params[:id])
  end

  # POST /evidence_batches
  # POST /evidence_batches.json
  def create
    @evidence_batch = EvidenceBatch.new(params[:evidence_batch])

    respond_to do |format|
      if @evidence_batch.save
        format.html { redirect_to @evidence_batch, notice: 'Evidence batch was successfully created.' }
        format.json { render json: @evidence_batch, status: :created, location: @evidence_batch }
      else
        format.html { render action: "new" }
        format.json { render json: @evidence_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /evidence_batches/1
  # PUT /evidence_batches/1.json
  def update
    @evidence_batch = EvidenceBatch.find(params[:id])

    respond_to do |format|
      if @evidence_batch.update_attributes(params[:evidence_batch])
        format.html { redirect_to @evidence_batch, notice: 'Evidence batch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evidence_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evidence_batches/1
  # DELETE /evidence_batches/1.json
  def destroy
    @evidence_batch = EvidenceBatch.find(params[:id])
    @evidence_batch.destroy

    respond_to do |format|
      format.html { redirect_to evidence_batches_url }
      format.json { head :no_content }
    end
  end
end
