class Sender
  include Celluloid

  def deliver_message(id)
    message = Message.find(id)
    raise 'Message already sent' if message.sent_at.present?
    Mailer.single(message).deliver
    message.update_attribute(:sent_at, Time.now)
  end

  def deliver_digest(ids)
    ids = ids.to_a

    case ids.count
    when 0
      raise 'No IDs given'
    when 1
      deliver_message(ids.first)
    else
      subject = "Digest of #{ids.count} messages"
      messages = Message.find(ids)
      messages.reject!(&:sent_at?)
      Mailer.digest(subject,messages).deliver
      messages.each{|m| m.update_attribute(:sent_at, Time.now)}
    end
  end
end
