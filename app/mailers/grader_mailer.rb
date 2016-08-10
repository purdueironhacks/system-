class GraderMailer < ApplicationMailer
  default from: 'jade888123@gmail.com'

  def welcome_email(grader)
    @grader = grader
    @login_url  = 'https://automatic-grading-system.herokuapp.com/graders/sign_in'
    mail(to: @grader.email, subject: 'Welcome to Automatic Grading System')
  end

  def project_assigned_email(grader, project_id)
    @grader = grader
    @project_url  = "https://automatic-grading-system.herokuapp.com/projects/#{project_id}/grades"
    mail(to: @grader.email, subject: 'You are assigned to grade new project!')
  end
end