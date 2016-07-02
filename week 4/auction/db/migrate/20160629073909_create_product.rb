class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.integer 		:user_id
	    t.string 		:title
	   	t.text	 		:description
	   	t.float			:minimum_price
	    t.datetime 		:deadline
      	t.timestamps 	null: false
    end
  end
end
