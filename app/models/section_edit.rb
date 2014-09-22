class SectionEdit < ActiveRecord::Base
	belogs_to :editor ,:class_name => "AdminUser",:foreign_key => "admin_user_id"
	belogs_to :section

	scope :visible,lambda{where(:visible=>:true)}

end
