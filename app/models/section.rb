class Section < ActiveRecord::Base

	belongs_to :page
	has_many :section_edits
	has_many :editors ,:through => :section_edits ,:class_name => "AdminUser"

	acts_as_list :scope=> :page

	scope :sorted,lambda{order("sections.position ASC")}

	CONTENT_TYPES = ['text','HTML']
	validates_presence_of :name
	validates_length_of :name , :maximum =>20
	validates_inclusion_of :content_type , :in => CONTENT_TYPES,:message => "Must be one of :#{CONTENT_TYPES.join(',')}"
	validates_presence_of :content
end
