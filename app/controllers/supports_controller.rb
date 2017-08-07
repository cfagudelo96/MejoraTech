class SupportsController < ApplicationController
  before_action :set_support, only: [:show, :edit, :update, :destroy]
  before_action :set_complaint, only: [:index, :new, :create, :destroy]

  # GET /supports
  # GET /supports.json
  def index
    @supports = @complaint.supports
  end

  # GET /supports/1
  # GET /supports/1.json
  def show
  end

  # GET /supports/new
  def new
    @support = Support.new
  end

  # GET /supports/1/edit
  def edit
  end

  # POST /supports
  # POST /supports.json
  def create
    @support = Support.new(support_params)
    @support.complaint_id = @complaint.id

    respond_to do |format|
      if @support.save
        format.html { redirect_to complaint_path(@complaint), notice: 'Support was successfully created.' }
        format.json { render :show, status: :created, location: @support }
      else
        format.html { render :new }
        format.json { render json: @support.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supports/1
  # PATCH/PUT /supports/1.json
  def update
    respond_to do |format|
      if @support.update(support_params)
        format.html { redirect_to complaint_path(@support.complaint), notice: 'Support was successfully updated.' }
        format.json { render :show, status: :ok, location: @support }
      else
        format.html { render :edit }
        format.json { render json: @support.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supports/1
  # DELETE /supports/1.json
  def destroy
    @support.destroy
    respond_to do |format|
      format.html { redirect_to complaint_path(@complaint), notice: 'Support was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_support
    @support = Support.find(params[:id])
  end

  def set_complaint
    @complaint = Complaint.find(params[:complaint_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def support_params
    params.require(:support).permit(:support_file, :description)
  end
end
