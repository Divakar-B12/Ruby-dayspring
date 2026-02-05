class AddColumnToProductCategory < ActiveRecord::Migration[8.1]
  def change
    add_column :product_categories, :name, :string
  end
end
