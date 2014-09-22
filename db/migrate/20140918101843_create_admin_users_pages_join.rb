class CreateAdminUsersPagesJoin < ActiveRecord::Migration
  def change
    create_table :admin_users_pages,:id =>false do |t|
    	t.integer "page_id"
    	t.integer "admin_user_id"
    end
    	puts "***********adding index on page_id and admin_user_id is next ********"
    	add_index("admin_users_pages","page_id")
    	add_index("admin_users_pages","admin_user_id")
    	#add_index :admin_users_pages, ["admin_user_id","page_id"]
    
  end

  def down
  	drop_table :admin_users_pages
  end
end
