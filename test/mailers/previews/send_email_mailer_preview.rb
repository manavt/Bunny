# Preview all emails at http://localhost:3000/rails/mailers/send_email_mailer
class SendEmailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/send_email_mailer/welcome_body
  def welcome_body
    SendEmailMailer.welcome_body
  end

end
