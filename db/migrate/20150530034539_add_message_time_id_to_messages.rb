class AddMessageTimeIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :message_time_id, :integer
  end
end
