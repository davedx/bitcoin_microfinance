require "rails_helper"

RSpec.describe LenderLoan, :type => :model do
  it "updates loan when saved" do
  	loan = Loan.create!(proposal: "stuff", amount: 6.5, title: "loan", repayment: "repayment")
  	lender_loan = LenderLoan.create!(amount: 3, interest: 0.053, loan: loan, user_id: 1)

  	expect(lender_loan.loan).to eq(loan)
  	expect(lender_loan.user_id).to eq(1)
  	expect(lender_loan.loan.status).to eq("created")

  	loan = Loan.last
  	lender_loan = LenderLoan.create!(amount: 19, interest: 0.053, loan: loan, user_id: 1)

  	expect(lender_loan.loan.status).to eq("funded")
  	expect(lender_loan.loan.term_months).to eq(12)
  	expect(lender_loan.loan.term_monthly_payment.to_f).to eq(-0.56)

  end
end