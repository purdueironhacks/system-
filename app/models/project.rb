class Project < ActiveRecord::Base
  belongs_to :student

  has_many :grades
  has_many :graders, through: :grades

  after_create :assign_random_grader

  def calculate_score_for(phase)
    all_grades = grades.where(phase: phase)
    total_score = 0
    technical_grade = all_grades.detect { |grade| grade.technical_grade? }
    usability_grade = all_grades.detect { |grade| grade.usability_grade? }

    if technical_grade.present?
      total_score += technical_grade.total_technical_score
    end

    if usability_grade.present?
      total_score += (usability_grade.total_user_experience_score + usability_grade.total_info_visualization_score)
    end

    if total_score < 0.001
      "Grade Unavailable"
    else
      total_score
    end
  end

  def usability_grader
    graders.where(grader_type: "User Interface Expert").first
  end

  private

  def assign_random_grader
    technical_expert = find_random_grader(type: "Technical Expert")
    user_interface_expert = find_random_grader(type: "User Interface Expert")
    self.graders << technical_expert << user_interface_expert
    send_email_to_graders([technical_expert, user_interface_expert])
  end

  def find_random_grader(type: type)
    Grader.where(grader_type: type).sample
  end

  def send_email_to_graders(graders)
    graders.each do |grader|
      GraderMailer.project_assigned_email(grader, self.id).deliver_now
    end
  end
end
