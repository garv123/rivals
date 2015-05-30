class Message < ActiveRecord::Base
  attr_accessor :message_date
  belongs_to :restaurant
  belongs_to :merchant
  belongs_to :format
  belongs_to :user
end
