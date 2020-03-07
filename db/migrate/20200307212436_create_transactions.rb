class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :type
      t.string :time_display
      t.string :coin_name
      t.string :api_user

      t.timestamps null: false
    end
  end
end
