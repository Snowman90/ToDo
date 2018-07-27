STDOUT.sync = true
require 'ostruct'
require "time"

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
		puts 'Co chcesz zrobic?'
		puts 'Mozliwe akcje to: quit/add/show/update/delete/finished/show all'
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
		when 'finished'
			finished
		else
			puts 'Nie wiem co mam zrobic'
		end

	end

	def add
		puts 'Jakie zadanie chcesz dodac?'
		new_task = gets.chomp
		@tasks << Task.new(new_task,"✕")
		puts "Zadanie - #{new_task} zostało dodane!"
		puts
	end


	def show
		puts 'Które zadanie chcesz pokazac?'
		task_id = gets.chomp.to_i
		if @tasks[task_id] == nil
			puts 'Nie ma takiego elementu na liście'
		else
			puts @tasks[task_id].title + " " + @tasks[task_id].status
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
			@tasks[task_id].title = new_task
		end
		puts
	end

	def finished
		puts 'Które zadanie chcesz zaktualizować?'
		task_id = gets.chomp.to_i
		if @tasks[task_id] == nil
			puts 'Nie ma takiego elementu na liście'
		else
			puts 'Czy zadanie zostało już wykonane?(T/N)'
			answer = gets.chomp
			case answer.upcase
			when 'T'
				@tasks[task_id].status = "✔"
				puts "Gratulacje zadanie #{@tasks[task_id].title} zostalo zakonczone"
			when 'N'
				@tasks[task_id].status = "✕"
			else
				puts 'Nie moge tego zrobic, status zadania pozostaje nie zmieniony'
			end
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
			puts "Zadanie - #{task.title} zostało usunięte!"
			puts
		end
	end


	def print_list
		puts '----------'
    	#puts @tasks.join("\n")
    	@tasks.each{|x| print x.title
    		print " "
    		print x.status, "\n"}
    	puts '----------'

	end

	def print_spacer
		puts '==========='
	end


end

class Task

	attr_accessor :title
	attr_accessor :status
	def initialize(title, status)
		@title = title
		@status = status
	end



end


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



ToDo.new.run


