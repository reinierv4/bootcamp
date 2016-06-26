require 'yaml'
require 'yaml/store'
require_relative 'task.rb'

module Storage
	
	def save
  		@todo_store.transaction do 
      		@todo_store[@user] = @tasks
  		end
  	end


  	def load_tasks

  		file = IO.read('/Users/reinierverbeek/ironhack/prework/Testing/ToDoList/public/tasks.yml')
  		@tasks =  YAML::load(file)[YAML::load(file).keys[0]]
  	end

  	def connection(path)
  		YAML::Store.new(path)
  	end


end


class TodoList
    attr_reader :tasks, :user
    include Storage
    
    def initialize(user)
    	@todo_store = connection('/Users/reinierverbeek/ironhack/prework/Testing/ToDoList/public/tasks.yml')
      @tasks = []
      @user = user
    end

    def add_task(task)
    	@tasks.push(task)
    end

    def delete_task(id)
    	@tasks.reject! { |task| task.id == id }
    end

    def find_task_by_id(id)
    	task = @tasks.find {|task| task.id == id}
    	return task
    end

    def sort_by_created(order)
    	
    	
    	sorted_tasks = @tasks.sort_by do |task|
    			task.created_at
    	end
    	
		if order.downcase == "asc"
    		sorted_tasks.reverse
		else
    		sorted_tasks
    	end

    	
    end

end







