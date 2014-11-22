class LoansController < ApplicationController
	def index
		@loans = Loan.where(:user_id => current_user.id)
	end

	def new
		@loan = Loan.new
	end

	def show
		@loan = Loan.find(params[:id])
	end

	def create
		@loan = Loan.new(params.require(:loan).permit(:proposal, :amount, :title, :repayment))
		@loan.user_id = current_user.id
    if @loan.save
      redirect_to @loan
    else
      render "new"
    end
  end

  def update
  	@loan = Loan.find(params[:id])
  	if @loan.update!(params.require(:loan).permit(:proposal))
  		redirect_to @loan
  	else
  		render "edit"
  	end
  end

	def edit
		@loan = Loan.find(params[:id])
	end
end
