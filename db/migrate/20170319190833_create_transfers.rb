class CreateTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :transfers do |t|
      t.string :account_number_from
      t.string :account_number_to
      t.integer :amount_pennies
      t.string :country_code_from
      t.string :country_code_to
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
