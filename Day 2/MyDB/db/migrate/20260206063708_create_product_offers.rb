class CreateProductOffers < ActiveRecord::Migration[8.1]
  def change
    create_table :product_offers do |t|
      t.references :product, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
