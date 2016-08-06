class Grader < ActiveRecord::Base
  has_many :grades
  has_many :projects, through: :grades
end
