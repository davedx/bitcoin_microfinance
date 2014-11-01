class Loan < ActiveRecord::Base
  belongs_to :borrower
  has_many :lender_loans
end
