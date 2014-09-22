class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
    	t.string "first_name" , :limit =>20
    	t.string "last_name",:limit =>30
    	t.string "email" ,:default =>"",:null => false
    	t.string "password",:limit =>40
    end
  end
  def down
    puts "*******droping users table is next*******"
  	drop_table :users
    puts "************droping users table is done***********"
  end
end
