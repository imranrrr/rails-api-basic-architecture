class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :sku
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
