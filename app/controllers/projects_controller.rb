class ProjectsController < ApplicationController
	def index
		@projects = Project.all
		@project = Project.new(id: 0)
		@todo = Todo.new
		respond_to do |format|
			format.html # index.html.erb
  			format.json { render json: @projects.to_json(:include => :todos) }
		end
	end

	private def project_params
		params.require(:project).permit(:project_id, :text)
	end
end
