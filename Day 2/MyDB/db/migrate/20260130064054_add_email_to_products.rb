class AddEmailToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :email, :string
  end
end
