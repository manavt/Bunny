Session - 17
  Action mailer
  GMail configuration
  Mail with attachment


  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "gmail.com",
    Authentication: "plain",
    enable_starttls_auto: true,
    user_name: 'testrorappmail',
    password: 'testrorappmail!12'
  }
 config.action_mailer.perform_deliveries = true


Association Part -1

Session - 24
  Social Media Integration




Session -19
  Advance Routes





Session - 23
  Ruby gems
  Ruby gems - will_paginate
  Debugging rails application


Session - 25
  Payment Integration


Session - 26
  Version control
  Git & GitHub
  Git DVCS
  Git- workflow
  Git Bash - command line
  Git Bash- push to github
  Heroku - cloud application platform

Session - 21
  Database Migration
  Generating CSV
  JSON
  XML


Session - 22
  Components of Rails Application








Dir["#{Rails.root}/lib/*.rb"].each { |file| require file }
