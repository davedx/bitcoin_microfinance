class AddLoanTermsToLoan < ActiveRecord::Migration
  def change
		add_column :loans, :term_monthly_payment, :decimal
		add_column :loans, :term_months, :decimal
  end
end
