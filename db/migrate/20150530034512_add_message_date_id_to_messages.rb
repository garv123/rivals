class AddMessageDateIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :message_date_id, :integer
  end
end
