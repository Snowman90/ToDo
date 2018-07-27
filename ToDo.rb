STDOUT.sync = true

class ToDo

	def run
		loop do
			print_hello
			parse_action
			execute
			#print_spacer
		end
	end

	private

	def print_hello
		puts 'Witaj, co chcesz zrobic?'
		puts 'Mozliwe akcje to: quit/add/show/update/delete/show all'
	end

	def parse_action
		@action = gets.chomp
	end

	def execute
		case @action
		when 'quit'
			puts 'No trudno...'
			exit
		when 'add'

		when 'show'

		when 'update'

		when 'delete'

		when 'show all'

		else
			puts 'Nie wiem co mam zrobic'
		end

	end

	def print_spacer
		puts '==========='
	end


end

ToDo.new.run
