class Loan < ActiveRecord::Base
  belongs_to :borrower
  has_many :lender_loans

  def update_lender_loans
  	funded_amount = 0.0
  	self.lender_loans.each do |lender_loan|
  		funded_amount += lender_loan.amount
  	end
  	if funded_amount >= amount
  		self.status = "funded"
  		self.save
  	end
  end
end
