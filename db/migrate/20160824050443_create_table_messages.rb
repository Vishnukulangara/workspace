class CreateTableMessages < ActiveRecord::Migration
  def change
    change_table :messages do |t|
    	#t.string :message
    	# t.integer :sender_id
    	# t.integer :reciever_id
    	# t.integer :archive
    	t.string :message_copy
      #t.timestamps null: false
    end
  end
end
