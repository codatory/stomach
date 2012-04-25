require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "digest" do
    mail = Mailer.digest
    assert_equal "Digest", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "single" do
    mail = Mailer.single
    assert_equal "Single", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
