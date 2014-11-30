class SetStatusDefaultForLoanAndAddIndex < ActiveRecord::Migration
  def change
		change_column :loans, :status, :string, :default => "created", :index => true
  end
end
