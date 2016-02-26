class CreateMeds < ActiveRecord::Migration[5.0]
  def change
    create_table :meds do |t|
      t.string :brand_name
      t.string :generic_name
      t.string :apis
      t.integer :price_cents

      t.timestamps
    end
    add_index :meds, :brand_name
    add_index :meds, :generic_name
    add_index :meds, :apis
  end
end
