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
    'tech_criteria_8' => 'The application uses one of the libraries suggested (arbor.js, D3.Js, sigmajs, other libraries)',
    'non_tech_criteria_1' => 'The application/mash-up is developed for the users in West Lafayette/ Lafayette and the Greater Lafayette Area',
    'non_tech_criteria_2' => 'The application/mash-up provides at least 2 options (locations) for buying vegetables in West Lafayette/Lafayette and the Greater Lafayette Area',
    'non_tech_criteria_3' => 'The application/mash-up provides buying options with the information of freshness to the users',
    'non_tech_criteria_4' => 'The application/mash-up provides buying options with estimated prices to the users',
    'non_tech_criteria_5' => 'The application/mash-up provides the info that helps the users decide and compare where to go to buy (e g weather, products, prices, transportation etc)',
    'non_tech_criteria_6' => 'The page layout design in the App/mash-up is efficient (design)',
    'non_tech_criteria_7' => 'The user interface offers perceived interaction from the existing elements that can be understood by the user (functionality)',
    'non_tech_criteria_8' => 'The grouping of elements in the App/mash-up is efficient and effective (design)',
    'non_tech_criteria_9' => 'The user interface offers minimal necessary actions (in 3 steps) to find an option (functionality)',
    'non_tech_criteria_10' => 'The interface reduces cognitive load (e.g. By color coding, icons and other visual features and elements) (design)',
    'non_tech_criteria_11' => 'The user does not have to memorize a lot of information to find the alternative option (functionality)'
  }

  def total_technical_score
    sum = 0
    (1..8).each do |index|
      sum += send("tech_criteria_#{index}").to_f
    end
    sum * 12.5
  end

  def total_usability_score
    sum_1 = 0
    (1..5).each do |index|
      sum_1 += send("non_tech_criteria_#{index}").to_f
    end

    sum_1 = (sum_1 * 20.0)

    sum_2 = 0
    (6..11).each do |index|
      value = send("non_tech_criteria_#{index}").to_f
      sum_2 += ((value - 4) * (-1))
    end

    sum_2 = (sum_2 * 100) / 24

    sum_1 + sum_2
  end

  def technical_grade?
    technical == true
  end

  def usability_grade?
    usability == true
  end
end
