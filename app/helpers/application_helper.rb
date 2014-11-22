module ApplicationHelper
	def page_title(title)
		@page_title = title
	end

	def get_title
		t = ["Bitcoin Microfinance"]
		t.push(@page_title) if @page_title
		t.join(" - ")
	end
end
