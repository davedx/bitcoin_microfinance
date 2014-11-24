class CallbacksController < ApplicationController

=begin
Blockchain.info callback parameters from https://blockchain.info/api/api_receive

$real_secret = 'ZzsMLGKe162CfA5EcG6j';
$invoice_id = $_GET['invoice_id']; //invoice_id is passed back to the callback URL
$transaction_hash = $_GET['transaction_hash'];
$input_transaction_hash = $_GET['input_transaction_hash'];
$input_address = $_GET['input_address'];
$value_in_satoshi = $_GET['value'];
$value_in_btc = $value_in_satoshi / 100000000;

=end

  def received
  	logger.info "Receive callback from Blockchain..."
  	input_address = params[:input_address]
  	value = params[:value].to_f
  	#logger.info "Value: " + value.to_s
  	value_in_btc = value / 100000000
  	logger.info "Value in BTC: " + value_in_btc.to_s
  	# try to find user with input_address
  	user = User.find_by receive_address: input_address
  	if !user
  		logger.error "Received callback for address: " + input_address + " but cannot find user who owns address"
  		render body: "*error*"
  	else
  		user_balance = user.balance ? user.balance : 0.0
  		logger.info "User balance was: " + user_balance.to_s
  		user_balance += value_in_btc
  		user.balance = user_balance
  		user.save
  		logger.info "User balance now: " + user.balance.to_s
	  	render body: "*ok*"
	  end
  end
end
