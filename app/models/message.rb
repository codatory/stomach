class Message < ActiveRecord::Base
  belongs_to :recipient
  attr_accessible :recipient, :message, :subject

  scope :unsent, where(:sent_at => nil)
  scope :aged,   lambda { where('created_at < ?', 15.minutes.ago) }
end
