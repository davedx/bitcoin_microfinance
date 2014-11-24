require 'blockchain'

class Users::FundsController < ApplicationController
	def index
	end

	def edit
		if !current_user.receive_address
			logger.info "Current user has no receive address. Asking Blockchain for one..."
			resp = Blockchain::receive(
				'16ysD5Bx69nNeXjh7VA9mwQ3cNg6hM5SWq',
				'http://' + ENV['BITCOIN_MICROFINANCE_SERVER_IP'] + '/received')
			current_user.receive_address = resp.input_address
			current_user.save
		end
	end
end
