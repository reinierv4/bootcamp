require 'spec_helper'

describe Task do

	before :each do
		@task = Task.new("Do something")
	end

	describe "#new" do
		it "creates a new instance, the first instance has an id of 1" do 
			expect(@task.id).to eq(1)
		end
	end

	describe "#complete?" do
		it "returns the status of the task as a boolean by default false" do
			expect(@task.complete?).to be false
		end

	end

	describe "#complete!" do
		it "changes the status of a taks in to completed is true" do
			@task.complete!
			expect(@task.complete?).to be true
		end
	end

	describe "#make_incomplete!" do
		it "changes the status of a taks in to completed is false" do
			@task.complete!
			@task.make_incomplete!
			expect(@task.complete?).to be false
		end
	end

	describe "#update_content!" do 
		
		before :each do
			@task.update_content!("Updated content")
		end

		it "changes the content of the task" do
			expect(@task.content).to eq("Updated content")
		end

		it "updates the updated time for task" do
			expect(@task.updated_at).to be_truthy 
		end
	end

end

