class EvidenceBatchesController < ApplicationController
  http_basic_authenticate_with name: ENV["EU_UN"], password: ENV["EU_PW"], only: :index

  def index
    @evidence_batches = EvidenceBatch.includes(:evidences).all
    respond_to do |format|
      format.html
      format.json {render json: @evidence_batches}
    end
  end

  # GET /evidence_batches/new
  # GET /evidence_batches/new.json
  def new
    @evidence_batch = EvidenceBatch.new
    @count = Evidence.all.count
    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @evidence_batch }
    end
  end


  # POST /evidence_batches
  # POST /evidence_batches.json
  def create
    @evidence_batch = EvidenceBatch.new(params[:evidence_batch])

    respond_to do |format|
      if @evidence_batch.save
        format.html # create.html.haml
        format.json { render json: @evidence_batch, status: :created, location: @evidence_batch }
      else
        format.html { render action: "new" }
        format.json { render json: @evidence_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  def about
  end

end
