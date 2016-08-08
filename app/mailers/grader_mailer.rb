class GraderMailer < ApplicationMailer
  default from: 'jade888123@gmail.com'

  def welcome_email(grader)
    @grader = grader
    @login_url  = 'https://automatic-grading-system.herokuapp.com/graders/sign_in'
    mail(to: @grader.email, subject: 'Welcome to Automatic Grading System')
  end
end
