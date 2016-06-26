class Task
    
    attr_reader :content, :id, :updated_at, :created_at
    
    @@current_id = 1
    
    def initialize(content)
        @content = content
        @created_at = Time.now
        @id = @@current_id
        @completed = false
        @@current_id += 1
        @updated_at = nil
    end

    

    def complete?
    	@completed
    end

    def complete!
    	@completed = true
    end

    def make_incomplete!
    	@completed = false
    end

    def update_content! new_content

    	@content = new_content
    	@updated_at = Time.now
    end


end


