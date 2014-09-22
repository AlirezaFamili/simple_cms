class CreateSectionEdits < ActiveRecord::Migration
  def change
    create_table :section_edits do |t|
    	t.references :admin_user
    	t.references :section
    	#t.string :summary
    	t.string "summary"

      t.timestamps
    end
    add_index :section_edits,["section_id","admin_user_id"]
  end
end
