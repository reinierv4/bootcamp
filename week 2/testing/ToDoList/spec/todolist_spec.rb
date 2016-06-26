require 'spec_helper'

describe TodoList do

	before :each do
		@todo = TodoList.new("Josh")
		@task = Task.new("something")
	end

	describe "#new" do
		it "creates a todo list with a username" do
			expect(@todo.user).to eq ("Josh")
		end
	end



	describe "#add_task" do
		it "adds a task to the todolist array" do
			@todo.add_task(@task)
			expect(@todo.tasks.length).to eq(1)
		end

	end

	describe "#delete_task" do
		it "deletes the task with the specified id" do
		 	@todo.delete_task(1)
		 	expect(@todo.tasks.find {|task| task.id == 1}).to be nil
		 end
	end

	describe "#find_task_by_id" do
		it "returns the task with the specified id if it exists" do
			@todo.add_task(Task.new("Walk the dog"))
			@todo.add_task(Task.new("Buy the milk"))
			expect(@todo.find_task_by_id(1).content).to eq("something")
		end
	end

	describe "#find_task_by_id" do
		it "returns nil if the task searched for doesn't exists" do
			expect(@todo.find_task_by_id(100)).to be_nil
		end
	end

	describe "#sort_by_created" do
		it "sort by the date the tasks where created" do
			@todo.add_task(Task.new("Walk the dog"))
			@todo.add_task(Task.new("Buy the milk"))
			expect(@todo.sort_by_created("asc")[0].created_at < @todo.sort_by_created("asc")[1].created_at).to be false
		end
	end

	describe "#sort_by_created" do
		it "sort by the date the tasks where created" do
			@todo.add_task(Task.new("Walk the dog"))
			@todo.add_task(Task.new("Buy the milk"))
			expect(@todo.sort_by_created("des")[0].created_at < @todo.sort_by_created("des")[1].created_at).to be true
		end
	end

	describe "#save" do
		
		it "saves todo list from the users and allows to re-open the to-do list at a later stage" do
			@todo.add_task(@task)
			@todo.add_task(Task.new("Walk the dog"))
			@todo.add_task(Task.new("Make my todo list into a web app"))
			@todo.save
			todo_list = TodoList.new("Josh")
			todo_list.load_tasks
			expect(todo_list.tasks.length).to be (3)
		end
	end





end
