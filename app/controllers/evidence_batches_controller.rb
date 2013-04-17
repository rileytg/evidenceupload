class EvidenceBatchesController < ApplicationController


  # GET /evidence_batches/new
  # GET /evidence_batches/new.json
  def new
    @evidence_batch = EvidenceBatch.new
    @count = Evidence.all.count
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evidence_batch }
    end
  end


  # POST /evidence_batches
  # POST /evidence_batches.json
  def create
    @evidence_batch = EvidenceBatch.new(params[:evidence_batch])

    respond_to do |format|
      if @evidence_batch.save
        format.html { redirect_to new_evidence_batch_path, notice: 'Evidence batch was successfully added.' }
        format.json { render json: @evidence_batch, status: :created, location: @evidence_batch }
      else
        format.html { render action: "new" }
        format.json { render json: @evidence_batch.errors, status: :unprocessable_entity }
      end
    end
  end

end
