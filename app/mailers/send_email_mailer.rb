class SendEmailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_email_mailer.welcome_body.subject
  #
  def welcome_body(user)
     @user = user
     attachments['p1.png'] = File.read("/Users/1228369/Documents/Ruby-Content/p1.png")
     mail(to: user.email, from: "ecom@onlinestore.in", subject: "Welcome to online shop")
  end
  # def news_subs(user)
  #
  # end
end
