class AddColumnsToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :user_id, :integer
    add_column :loans, :title, :string
    add_column :loans, :repayment, :text
  end
end
