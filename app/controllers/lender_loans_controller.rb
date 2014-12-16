class LenderLoansController < ApplicationController
	def index
		@lender_loans = LenderLoan.all
	end

	def my_lender_loans
		@lender_loans = LenderLoan.where(:user_id => current_user.id)
	end

	def new
		@loan = Loan.find(params[:loan_id])
		@owner = User.find(@loan.user_id)
		@lender_loan = LenderLoan.new
	end

	def create
		@lender_loan = LenderLoan.new(params.require(:lender_loan).permit(:amount, :interest))
		@loan = Loan.find(params[:loan_id])
		@owner = User.find(@loan.user_id)
		@lender_loan.user_id = current_user.id
		@lender_loan.loan = @loan
    if @lender_loan.save
      redirect_to @loan
    else
      render "new"
    end
  end
end
