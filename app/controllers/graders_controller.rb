class GradersController < ApplicationController
  before_action :set_grader, only: [:show, :edit, :update, :destroy]

  # GET /graders
  # GET /graders.json
  def index
    @graders = Grader.all
  end

  # GET /graders/1
  # GET /graders/1.json
  def show
  end

  # GET /graders/new
  def new
    @grader = Grader.new
  end

  # GET /graders/1/edit
  def edit
  end

  # POST /graders
  # POST /graders.json
  def create
    @grader = Grader.new(grader_params)

    respond_to do |format|
      if @grader.save
        format.html { redirect_to @grader, notice: 'Grader was successfully created.' }
        format.json { render :show, status: :created, location: @grader }
      else
        format.html { render :new }
        format.json { render json: @grader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graders/1
  # PATCH/PUT /graders/1.json
  def update
    respond_to do |format|
      if @grader.update(grader_params)
        format.html { redirect_to @grader, notice: 'Grader was successfully updated.' }
        format.json { render :show, status: :ok, location: @grader }
      else
        format.html { render :edit }
        format.json { render json: @grader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graders/1
  # DELETE /graders/1.json
  def destroy
    @grader.destroy
    respond_to do |format|
      format.html { redirect_to project_graders_url(@project), notice: 'Grader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grader
      @grader = Grader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grader_params
      params.require(:grader).permit(:name, :email, :grader_type)
    end
end
