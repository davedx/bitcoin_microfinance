class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
