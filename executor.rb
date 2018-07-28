module ToDo
	class Executor
		def initialize(tasks)
			@tasks=tasks
		end

		def quit
			puts 'No trudno'
			exit
		end

		def add
			puts 'Jakie zadanie chcesz dodac?'
			new_task = gets.chomp
			@tasks << ToDo::Task.new(new_task,"✕")
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

		def search
			puts 'Podaj tytuł szukanego zadania'
			task_title = gets.chomp
			flag = 0
			@tasks.each{|x| if  x.title == task_title
								puts 'Szukane zadanie:'
								puts x.title + " " + x.status
								flag = 1

							end}
			if flag == 0
				puts 'Nie znaleziono elementu o tym tytule'
			end

		end

		def print_all
			puts '----------'
	    	#puts @tasks.join("\n")
	    	@tasks.each{|x| print x.title
	    		print " "
	    		print x.status, "\n"}
	    	puts '----------'

		end



	end
end