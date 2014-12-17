require 'finance'
include Finance

class Loan < ActiveRecord::Base
	belongs_to :user
	has_many :lender_loans

	def update_lender_loans
		funded_amount = 0.0
		interest = 0.0
		self.lender_loans.each do |lender_loan|
			funded_amount += lender_loan.amount
			interest += lender_loan.interest
		end
		if funded_amount >= amount
			new_loan(interest/self.lender_loans.count)
		end
	end

	private
		def new_loan (average_interest)
			self.status = "funded"
			self.term_months = 12 # TODO: load from default app settings
			rate = Rate.new(average_interest, :apr, :duration => self.term_months)
			amortization = Amortization.new(self.amount, rate)
			self.term_monthly_payment = amortization.payment
			self.save
		end
end
