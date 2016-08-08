class Grader < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_welcome_mail

  has_many :grades
  has_many :projects, through: :grades

  private

  def send_welcome_mail
    GraderMailer.welcome_email(self).deliver
  end
end
