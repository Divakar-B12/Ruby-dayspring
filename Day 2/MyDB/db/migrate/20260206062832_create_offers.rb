class CreateOffers < ActiveRecord::Migration[8.1]
  def change
    create_table :offers do |t|
      t.string :name
      t.boolean :status
      t.integer :discount

      t.timestamps
    end
  end
end
