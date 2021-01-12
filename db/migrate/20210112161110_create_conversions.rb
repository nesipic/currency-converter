class CreateConversions < ActiveRecord::Migration[6.0]
  def change
    create_table :conversions do |t|
      t.string :from_currency
      t.string :to_currency
      t.date :date
      t.float :amount
      t.float :result
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
