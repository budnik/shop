class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :subcategory
      t.string :code
      t.string :model_name
      t.string :vendor
      t.string :stock
      t.integer :warranty
      t.integer :prices, array: true
      t.references :price, index: true

      t.timestamps
    end
  end
end
