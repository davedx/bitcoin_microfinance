class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.datetime :disbursed_at
      t.decimal :amount
      t.float :interest
      t.text :proposal
      t.references :borrower, index: true

      t.timestamps
    end
  end
end
