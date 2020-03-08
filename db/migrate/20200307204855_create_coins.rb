class CreateCoins < ActiveRecord::Migration
  def change
    create_table :coins do |t|
      t.string :name
      t.decimal :unit_value
      t.integer :count

      t.timestamps null: false
    end
  end
end
