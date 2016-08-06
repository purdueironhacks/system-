class Project < ActiveRecord::Base
  belongs_to :student

  has_many :grades
  has_many :graders, through: :grades

  def calculate_score_for(phase)
    grades.where(phase: phase).pluck(:usability_score).compact.first.to_i +
        grades.where(phase: phase).pluck(:technical_score).compact.first.to_i
  end
end
