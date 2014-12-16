class SetStatusDefaultForLoan < ActiveRecord::Migration
  def change
		change_column :loans, :status, :string, :default => "created"
  end
end
