module ToDo
	class Event
		attr_accessor :title
		attr_accessor :status
		attr_accessor :date
		def initialize(title, status, date)
			@title = title
			@status = status
			@date = date
		end
	end
end