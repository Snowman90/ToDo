STDOUT.sync = true
module ToDo
	module Helpers
		def print_spacer
			puts '==========='
			puts
		end
		def print_hello
			puts 'Co chcesz zrobic?'
			puts 'Mozliwe akcje to: quit/add/show/update/delete/finished/search/print_all'
		end
	end
end
