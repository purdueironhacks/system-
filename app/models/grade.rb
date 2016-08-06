class Grade < ActiveRecord::Base
  belongs_to :project
  belongs_to :grader
end
