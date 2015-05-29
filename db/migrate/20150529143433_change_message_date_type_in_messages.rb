class ChangeMessageDateTypeInMessages < ActiveRecord::Migration
  def change
  	change_column :messages, :message_date, :timestamp
  end
end
