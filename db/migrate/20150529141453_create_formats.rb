class CreateFormats < ActiveRecord::Migration
  def change
    create_table :formats do |t|
      t.string :sender_name
      t.string :msg_regex_pattern
      t.integer :merchant_code

      t.timestamps null: false
    end
  end
end
