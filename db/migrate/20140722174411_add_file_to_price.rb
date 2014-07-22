class AddFileToPrice < ActiveRecord::Migration
  def change
    add_column :prices, :file, :string
  end
end
