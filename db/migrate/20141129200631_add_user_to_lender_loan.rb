class AddUserToLenderLoan < ActiveRecord::Migration
  def change
    add_reference :lender_loans, :user, index: true
  end
end
