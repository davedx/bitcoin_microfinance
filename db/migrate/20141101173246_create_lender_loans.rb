class CreateLenderLoans < ActiveRecord::Migration
  def change
    create_table :lender_loans do |t|
      t.references :loan, index: true
      t.float :interest
      t.decimal :amount
      t.references :lender, index: true

      t.timestamps
    end
  end
end
