class LenderLoan < ActiveRecord::Base
  belongs_to :loan
  belongs_to :lender
end
