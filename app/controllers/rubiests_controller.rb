class RubiestsController < ApplicationController
  before_action :set_rubiest, only: [:edit, :update, :destroy]

  # GET /rubiests
  # GET /rubiests.json
  def index
    @rubiests = Rubiest.all.page(params[:page]).per(10)
    if @rubiests.present?
      @rubiest = Rubiest.friendly.find(params[:id].present? ? params[:id] : @rubiests.first)
    end
  end

  # GET /rubiests/1
  # GET /rubiests/1.json
  def show
    @rubiests = Rubiest.all.page(params[:page]).per(10)
    if @rubiests.present?
      @rubiest = Rubiest.friendly.find(params[:id].present? ? params[:id] : @rubiests.first)
    end
  end

  # GET /rubiests/new
  def new
    @rubiest = Rubiest.new
  end

  # GET /rubiests/1/edit
  def edit
  end

  # POST /rubiests
  # POST /rubiests.json
  def create
    @rubiest = Rubiest.new(rubiest_params)

    respond_to do |format|
      if @rubiest.save
        format.html { redirect_to @rubiest, notice: 'Rubiest was successfully created.' }
        format.json { render :show, status: :created, location: @rubiest }
      else
        format.html { render :new }
        format.json { render json: @rubiest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rubiests/1
  # PATCH/PUT /rubiests/1.json
  def update
    respond_to do |format|
      if @rubiest.update(rubiest_params)
        format.html { redirect_to @rubiest, notice: 'Rubiest was successfully updated.' }
        format.json { render :show, status: :ok, location: @rubiest }
      else
        format.html { render :edit }
        format.json { render json: @rubiest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rubiests/1
  # DELETE /rubiests/1.json
  def destroy
    @rubiest.destroy
    respond_to do |format|
      format.html { redirect_to rubiests_url, notice: 'Rubiest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rubiest
      @rubiest = Rubiest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rubiest_params
      params.require(:rubiest).permit(:title, :description, :user_id, :featured)
    end
end
