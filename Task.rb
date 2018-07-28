module ToDo
	class Task
		attr_accessor :title
		attr_accessor :status
		def initialize(title, status)
			@title = title
			@status = status
		end
	end
end
