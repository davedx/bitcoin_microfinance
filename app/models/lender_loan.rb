class LenderLoan < ActiveRecord::Base
	validates :amount, presence: true
	validates :interest, presence: true
	validate :user_has_sufficient_funds, unless: Proc.new { |a| a.amount.blank? }

	belongs_to :loan
	belongs_to :user

	after_save :lender_loan_saved

	def user_has_sufficient_funds
		owner = User.find(self.user_id)
		if owner.balance < self.amount
			errors.add(:amount, "You do not have sufficient funds")
		end
	end

	private
		def lender_loan_saved
			owner = User.find(self.user_id)
			owner.balance -= self.amount
			owner.save
			self.loan.update_lender_loans
		end
end
