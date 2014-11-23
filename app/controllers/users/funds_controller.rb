require 'blockchain'

class Users::FundsController < ApplicationController
	def index
	end

	def edit
		resp = Blockchain::receive('16ysD5Bx69nNeXjh7VA9mwQ3cNg6hM5SWq', 'http://87.208.217.136/')
		@input_address = resp.input_address
	end
end
