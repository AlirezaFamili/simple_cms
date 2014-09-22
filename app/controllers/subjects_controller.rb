class SubjectsController < ApplicationController

	layout 'admin'
	before_action :confirm_logged_in
	def index
		@subjects = Subject.sorted

	end
	def show
		@subject = Subject.find(params[:id])
	end
	def new
		# works without this too.but this provides the default value on each form,ie.visible was set false in migrations and it will show hear
		@subject = Subject.new({:name => 'Input your name'})
		@subject_count = Subject.count + 1
	end
	def create
		@subject = Subject.new(subject_params)
			if @subject.save
				flash[:notice] = "Subject was created successfuly!"
				redirect_to(:action=>'index')
			else
				@subject_count = Subject.count + 1
				render 'new'
			end
	end
	def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  	end
	def update
		@subject = Subject.find(params[:id])
		# important! first you wrote @subject = Subeject.update_attributes(subject_params) whitch is wrong!!
		if @subject.update_attributes(subject_params)
			flash[:notice] = "Subject updated successfuly"
			redirect_to(:action => 'show', :id => @subject.id)
		else
			@subject_count = Subject.count
			render 'edit'
		end
	end
	def delete
		@subject =Subject.find(params[:id])
		flash[:notice] = "Are you sure you want to delete #{}?"
	end
	def destroy
		@subject =Subject.find(params[:id]).destroy
		flash[:notice] ="Subejct #{} destroyed successfully!"
		redirect_to(:action => 'index')
	end


	private

		def subject_params
			params.require(:subject).permit(:name,:position,:visible,:created_at)

		end
end
