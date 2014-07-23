class AddStateToPrice < ActiveRecord::Migration
  def change
    add_column :prices, :state, :string
  end
end
