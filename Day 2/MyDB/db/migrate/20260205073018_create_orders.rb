class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.integer :count
      t.string :details

      t.timestamps
    end
  end
end
