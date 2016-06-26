require 'sinatra'
require 'sinatra/reloader' if development?
require "bundler/setup"
require 'pry'

require_relative('lib/task.rb')
require_relative('lib/todolist.rb')

todo_list = TodoList.new("Josh")

configure do
	enable(:session)
	
end



get "/tasks" do
  	
  	session.clear
  	todo_list.load_tasks
  	session[:saved_value] = todo_list
	erb :task_index, :locals => {:todo_list => todo_list}

end

get "/new_tasks" do
  	

  	erb :new_task

end

get "/create_task" do
  	


 	
 	task = Task.new(params["content"])
	todo_list.load_tasks
	todo_list.add_task(task)
	
	todo_list.save
	

	redirect to('/tasks')

end

get "/complete_task:id" do
  	
	
	task = todo_list.find_task_by_id(params["id"].split(':')[1].to_i)
	task.complete!
	todo_list.save
	redirect to('/tasks')

end

get "/delete_task:id" do
  	
	todo_list.delete_task(params["id"].split(':')[1].to_i)
	todo_list.save
	redirect to('/tasks')

end