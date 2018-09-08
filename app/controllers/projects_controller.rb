class ProjectsController < ApplicationController
	def index
		@projects = Project.all
		@project = Project.new(id: 0)
		@todo = Todo.new
	end

	private def project_params
		params.require(:project).permit(:project_id, :text)
	end
end
