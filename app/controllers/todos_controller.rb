class TodosController < ApplicationController
	
	def create
		params = project_params
		todo = Todo.new(text: params[:text], isCompleted: false, project_id: params[:project_id])
		todo.save
		respond_to do |format|
		    msg = { :status => "ok", :message => "Success!"}
		    format.json  { render :json => msg } # don't do msg.to_json
		    format.html {redirect_to root_path}
		end
	end

	def toggle
		Todo.update(params[:todo_id], isCompleted: params[:isCompleted])
		puts params[:todo_id]
		respond_to do |format|
			msg = { :status => "ok", :message => "Success!"}
			format.json  { render :json => msg } # don't do msg.to_json
			format.html
		end
	end

	private def project_params
		params.require(:todo).permit(:project_id, :text)
	end
end
