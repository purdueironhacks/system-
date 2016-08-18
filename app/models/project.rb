class Project < ActiveRecord::Base
  belongs_to :student

  has_many :grades
  has_many :graders, through: :grades

  after_create :assign_random_grader

  def calculate_score_for(phase)
    # update this to calculate scores correctly
    grade = grades.where(phase: phase).first

    if grade.present?
      grade.total_technical_score + grade.total_usability_score
    else
      "Grade Unavailable"
    end
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
