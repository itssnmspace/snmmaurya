class RubyistsController < ApplicationController
  before_action :set_rubyist, only: [:edit, :update, :destroy]

  # GET /rubiests
  # GET /rubiests.json
  def index
    @rubyists = Rubyist.all.page(params[:page]).per(10)
    if @rubyists.present?
      @rubyist = Rubyist.friendly.find(params[:id].present? ? params[:id] : @rubyists.first)
    end
  end

  # GET /rubiests/1
  # GET /rubiests/1.json
  def show
    @rubyists = Rubyist.all.page(params[:page]).per(10)
    if @rubyists.present?
      @rubyist = Rubyist.friendly.find(params[:id].present? ? params[:id] : @rubyists.first)
    end
  end

  # GET /rubiests/new
  def new
    @rubyist = Rubyist.new
  end

  # GET /rubiests/1/edit
  def edit
  end

  # POST /rubiests
  # POST /rubiests.json
  def create
    @rubyist = Rubyist.new(rubyist_params)

    respond_to do |format|
      if @rubyist.save
        format.html { redirect_to @rubyist, notice: 'Rubyist was successfully created.' }
        format.json { render :show, status: :created, location: @rubyist }
      else
        format.html { render :new }
        format.json { render json: @rubyist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rubiests/1
  # PATCH/PUT /rubiests/1.json
  def update
    respond_to do |format|
      if @rubyist.update(rubyist_params)
        format.html { redirect_to @rubyist, notice: 'Rubyist was successfully updated.' }
        format.json { render :show, status: :ok, location: @rubyist }
      else
        format.html { render :edit }
        format.json { render json: @rubyist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rubiests/1
  # DELETE /rubiests/1.json
  def destroy
    @rubyist.destroy
    respond_to do |format|
      format.html { redirect_to rubiests_url, notice: 'Rubiest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rubyist
      @rubyist = Rubiest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rubyist_params
      params.require(:rubyist).permit(:title, :description, :user_id, :featured)
    end
end
