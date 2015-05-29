class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.integer :merchant_code
      t.string :merchant_value

      t.timestamps null: false
    end
  end
end
