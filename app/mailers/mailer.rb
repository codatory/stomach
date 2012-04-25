class Mailer < ActionMailer::Base
  default :from => "setme@example.com"

  def digest(subject, messages)
    @messages = messages
    mail :to => messages.collect(&:recipients).uniq.collect(&:email), :subject => subject
  end

  def single(message)
    @body = message.message
    mail :to => message.recipient.email, :subject => message.subject
  end
end
