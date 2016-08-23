class GraderMailer < ApplicationMailer
  default from: 'jade888123@gmail.com'

  def welcome_email(grader)
    @grader = grader
    @login_url  = 'https://automatic-grading-system.herokuapp.com/graders/sign_in'
    mail(to: @grader.email, subject: 'Welcome to Automatic Grading System')
  end

  def project_assigned_email(grader, project_id, grade_id = nil)
    @grader = grader
    @project_url  = "https://automatic-grading-system.herokuapp.com/projects/#{project_id}/grades"
    @grade_edit_url  = "https://automatic-grading-system.herokuapp.com/projects/#{project_id}/grades/#{grade_id}/edit"
    project = Project.find(project_id)
    @project_web_url = project.web_url
    @project_read_me_url = project.read_me_url
    mail(to: @grader.email, subject: 'You are assigned to grade new project!')
  end
end
