class Grade < ActiveRecord::Base
  belongs_to :project
  belongs_to :grader

  CRITERIA_CODE_TO_DESC_MAP = {
    'tech_criteria_1' => 'The application uses the mandatory dataset: Climate Data Online',
    'tech_criteria_2' => 'Using JavaScript, and adhere to the rules of the W3 School',
    'tech_criteria_3' => 'The application uses at least one dataset from Data.gov that was released by the State of Indiana',
    'tech_criteria_4' => 'The application is written in JavaScript language',
    'tech_criteria_5' => 'The website integrates a mashup',
    'tech_criteria_6' => 'The code submission is complemented with a readme file',
    'tech_criteria_7' => 'Does the readme have: Keywords, brief description, a unique identifier of the author, browser within which it was tested (has to be Chrome)',
    'tech_criteria_8' => 'The application uses one of the libraries suggested (arbor.js, D3.Js, sigmajs, other libraries)'
  }

  def total_technical_score
    sum = 0
    (1..8).each do |index|
      sum += send("tech_criteria_#{index}").to_f
    end
    sum * 12.5
  end

  def total_usability_score
    0
  end
end
