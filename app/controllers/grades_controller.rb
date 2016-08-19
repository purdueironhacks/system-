class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  before_action :set_project

  def index
    @project = Project.find(params[:project_id])
    @grades = @project.grades.includes(:grader).order('graders.email')
  end

  def show
  end

  # GET /grades/new
  def new
    @grade = @project.grades.new
  end

  def edit
  end

  def create
    @grade = @project.grades.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to project_grade_path(@project, @grade), notice: 'Grade was successfully created.' }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to [@project, @grade], notice: 'Grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to project_grades_url(@project), notice: 'Grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params
        .require(:grade)
        .permit(
          :project_id,
          :grader_id,
          :usability_score,
          :technical_score,
          :phase,
          :tech_criteria_1,
          :tech_criteria_2,
          :tech_criteria_3,
          :tech_criteria_4,
          :tech_criteria_5,
          :tech_criteria_6,
          :tech_criteria_7,
          :tech_criteria_8,
          :non_tech_criteria_1,
          :non_tech_criteria_2,
          :non_tech_criteria_3,
          :non_tech_criteria_4,
          :non_tech_criteria_5,
          :non_tech_criteria_6,
          :non_tech_criteria_7,
          :non_tech_criteria_8,
          :non_tech_criteria_9,
          :non_tech_criteria_10,
          :non_tech_criteria_11,
          :technical,
          :usability
        )
    end
end
