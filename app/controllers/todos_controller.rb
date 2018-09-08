class TodosController < ApplicationController
	def create
		params = project_params
		todo = Todo.new(text: params[:text], isCompleted: false, project_id: params[:project_id])
		todo.save
		redirect_to root_path
	end

	private def project_params
		params.require(:todo).permit(:project_id, :text)
	end
end
