class CreateBid < ActiveRecord::Migration
  def change
    create_table :bids do |t|
    	t.integer 		:product_id
    	t.integer		:user_id
    	t.float			:ammount
    	t.timestamps 	null: false
    end
  end
end
