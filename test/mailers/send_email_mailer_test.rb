require 'test_helper'

class SendEmailMailerTest < ActionMailer::TestCase
  test "welcome_body" do
    mail = SendEmailMailer.welcome_body
    assert_equal "Welcome body", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
