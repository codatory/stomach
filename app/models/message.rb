class Message < ActiveRecord::Base
  belongs_to :recipient
  attr_accessible :message, :subject
end
