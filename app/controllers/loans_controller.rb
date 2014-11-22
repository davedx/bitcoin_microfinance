class LoansController < ApplicationController
	def index
	end

	def new
		@loan = Loan.new
	end

	def show
		@loan = Loan.find(params[:id])
	end

	def create
		@loan = Loan.new(params.require(:loan).permit(:proposal, :amount))
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
