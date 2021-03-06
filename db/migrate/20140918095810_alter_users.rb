class AlterUsers < ActiveRecord::Migration
  def up
  	rename_table("users","admin_users")
  	add_column("admin_users","username",:string,:limit=>25,:after=>"email")
  	rename_column("admin_users","password","hashed_password")
  	puts "*****adding index on username is next"
  	add_index("admin_users","username")
  end

  def down
  	remove_index("admin_users","username")
  	rename_column("admin_users","hashed_password","password")
  	remove_column("admin_users","username",:string,:limit=>25,:after=>"email")
  	rename_table("admin_users","users")
  	
 
  end
end
