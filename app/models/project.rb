class Project < ActiveRecord::Base
  belongs_to :student

  has_many :grades
  has_many :graders, through: :grades
end
