#require 'blockchain'

class Users::FundsController < ApplicationController
	def index
	end

	def edit
		resp = Blockchain::receive('16ysD5Bx69nNeXjh7VA9mwQ3cNg6hM5SWq', 'http://localhost')
	end
end
