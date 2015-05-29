class Message < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :merchant
  belongs_to :format
  belongs_to :user
end
