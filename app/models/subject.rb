class Subject < ActiveRecord::Base

	scope :visible,lambda{where(:visible => true )}
	scope :invisible ,lambda{where(:visible => false)}
	scope :sorted, lambda { order("subjects.position ASC") }
	scope :newest_first , lambda{sort("Subjects.created_at ASC")}
	scope :search ,lambda{|query| where(["name LIKE?","%#{query}"])}

	has_many :pages

	acts_as_list

	validates_presence_of :name
	validates_length_of :name , :maximum =>20
end
