class CreateTrackInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :track_inventories do |t|
      t.integer :stock_days
      t.integer :delivery_days
      t.integer :required_quantities
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
