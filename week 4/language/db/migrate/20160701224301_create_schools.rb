class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
    	t.string		:contact
    	t.string 		:name
    	t.string		:city
    	t.float	 	 	:price
    	t.text			:description
      	t.timestamps null: false
    end
  end
end
