class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :company_name
      t.string :person_name
      t.integer :phone_number
      t.string :email
      t.text :note
      t.references :price, index: true
      t.integer :product_ids, array: true

      t.timestamps
    end
  end
end
