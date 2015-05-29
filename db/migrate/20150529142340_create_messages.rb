class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.float :amount
      t.references :restaurant, index: true
      t.string :location
      t.string :sublocation
      t.date :message_date
      t.references :merchant, index: true
      t.references :format, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :messages, :restaurants
    add_foreign_key :messages, :merchants
    add_foreign_key :messages, :formats
    add_foreign_key :messages, :users
  end
end
