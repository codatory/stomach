class Sender
  include Celluloid

  def deliver_message(id)
    message = Message.find(id)
    raise 'Message already sent' if message.sent_at.present?
    Mailer.deliver_single(message)
    message.update_attributes(:sent_at => Time.now)
  end

  def deliver_digest(ids)
    ids.to_a!

    case ids.count
    when 0
      raise 'No IDs given'
    when 1
      deliver_message(ids.first)
    else
      subject = "Digest of #{ids.count} messages"
      messages = Message.find(ids)
      Mailer.deliver_digest(subject,messages)
    end
  end
end
