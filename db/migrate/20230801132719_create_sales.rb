class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.integer :items
      t.float :total_price
      t.date :sold_date
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
