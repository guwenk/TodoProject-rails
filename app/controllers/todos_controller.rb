class TodosController < ApplicationController
	def index
		@todos = Todo.all
		respond_to do |format|
  			format.json { render json: @todos }
		end
	end
	
	def create
		params = project_params
		todo = Todo.new(text: params[:text], isCompleted: false, project_id: params[:project_id])
		todo.save
		redirect_to root_path
	end

	def toggle
		Todo.update(params[:todo_id], isCompleted: params[:isCompleted])
		puts params[:todo_id]
	end

	private def project_params
		params.require(:todo).permit(:project_id, :text)
	end
end
