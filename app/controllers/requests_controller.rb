class RequestsController < ApplicationController
  before_action :set_request, only: %i[ show edit update destroy update_processing_status]
  before_action :correct_user, only: [:edit, :update ]

  # GET /requests or /requests.json
  def index
    if current_admin
      @requests = Request.all
    else
      @requests = current_user.requests 
    end
  end

  def approve
    @request = request.find(params[:request_id])
    if params[:status]== 'Pending'
     @request.update_attributes(status: :pending)
     redirect_to processing, flash: {notice: "request is now processing."}
    end
  end

  def update_processing_status
    if current_user.admin? # Ensure only admin can update the status
      if @request.update(status: 'processing')
        redirect_to processing_request_path(@request), notice: 'Request status updated to processing.'
      else
        redirect_to @request, alert: 'Failed to update request status.'
      end
    else
      redirect_to @request, alert: 'You are not authorized to perform this action.'
    end
  end

  # GET /requests/1 or /requests/1.json
  def show
    @request = Request.find(params[:id])
  end

  # GET /requests/new
  def new
    #@request = Request.new
    @request = current_user.requests.build
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests or /requests.json
  def create
    #@request = Request.new(request_params)
    @request = current_user.requests.build(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to request_url(@request) }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to request_url(@request), notice: "Request was successfully updated." }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end




  # DELETE /requests/1 or /requests/1.json
  def destroy
    @request = Request.find(params[:id])
    @request.delete
    redirect_to requests_url
    #@request.destroy!
    #respond_to do |format|
      #format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      #format.json { head :no_content }
    #end
  end

  def correct_user
    @request = current_user.requests.find_by(id: params[:id])
    redirect_to requests_path, notice: 'Not Authorized' if @request.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:fullname, :student_number, :document, :request_reason, :user_id)
    end

    def processing
      @request.update(status: params[:new_status])
    redirect_to @request, notice: 'Status updated successfully.'
    end
end