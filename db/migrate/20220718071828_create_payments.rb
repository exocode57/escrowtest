class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :payer_email
      t.string :payer_name
      t.string :payer_address
      t.string :payer_phone
      t.integer :stuff_id

      t.timestamps
    end
  end
end
