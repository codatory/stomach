class BgMail
  include Celluloid

  def poll
    recipients = Message.unsent.aged.group(:recipient_id).map(&:recipient_id)
    Recipient.find(recipients).each do |reciever|
      QMAIL.actor.deliver_digest(reciever.messages.unsent.map(&:id))
    end
  end
end
