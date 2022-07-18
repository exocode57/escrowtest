class CreateStuffs < ActiveRecord::Migration[7.0]
  def change
    create_table :stuffs do |t|
      t.string :stuff_name
      t.integer :stuff_price
      t.string :stuff_code

      t.timestamps
    end
  end
end
