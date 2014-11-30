class LenderLoan < ActiveRecord::Base
	belongs_to :loan
	belongs_to :lender

	after_save :update_loan

	private
		def update_loan
			self.loan.update_lender_loans
		end
end
