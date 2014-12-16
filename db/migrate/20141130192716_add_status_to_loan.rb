class AddStatusToLoan < ActiveRecord::Migration
  def change
    add_column :loans, :status, :string, :index => true
  end
end
