class AddMoneyToMeds < ActiveRecord::Migration[5.0]
  def change
    remove_column :meds, :price_cents
    add_monetize :meds, :price

  end
end
