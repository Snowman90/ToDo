STDOUT.sync = true
require 'ostruct'
require "time"
require_relative './Task'
require_relative './helpers'
require_relative './executor'

module ToDo
	class App

		def initialize
			@tasks = []
			@executor = ToDo::Executor.new(@tasks)
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

		include ToDo::Helpers

		def parse_action
			@action = gets.chomp
		end

		def execute
			 if @executor.respond_to?(@action)
        			@executor.send(@action)
        	else
        		puts 'Nie wiem co mam zrobic'
      		end
		end
	end
end





ToDo::App.new.run


