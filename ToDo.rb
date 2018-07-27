STDOUT.sync = true

class ToDo

	def initialize
		@tasks = []
	end

	def run
		loop do
			print_hello
			parse_action
			execute
			print_spacer
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
			add

		when 'show'
			show

		when 'update'
			update

		when 'delete'
			delete

		when 'show all'
			print_list
		else
			puts 'Nie wiem co mam zrobic'
		end

	end

	def add
		puts 'Jakie zadanie chcesz dodac?'
		new_task = gets.chomp
		@tasks << new_task
		puts "Zadanie - #{new_task} zostało dodane!"
		puts
	end


	def show
		puts 'Które zadanie chcesz pokazac?'
		task_id = gets.chomp.to_i
		if @tasks[task_id] == nil
			puts 'Nie ma takiego elementu na liście'
		else
			puts @tasks[task_id]
		end
		puts
	end

	def update
		puts 'Które zadanie chcesz zaktualizować?'
		task_id = gets.chomp.to_i
		if @tasks[task_id] == nil
			puts 'Nie ma takiego elementu na liście'
		else
			puts 'Podaj nową nazwę zadania'
			new_task = gets.chomp
			@tasks[task_id] = new_task
		end
		puts
	end

	def delete
		puts 'Które zadanie chcesz skasować'
		task_id = gets.chomp.to_i
		if @tasks[task_id] == nil
			puts 'Nie ma takiego elementu na liście'
		else
			task = @tasks.delete_at(task_id)
			puts "Zadanie - #{task} usunięte!"
			puts
		end
	end


	def print_list
		puts '----------'
    	puts @tasks.join("\n")
    	puts '----------'

	end

	def print_spacer
		puts '==========='
	end


end

ToDo.new.run
