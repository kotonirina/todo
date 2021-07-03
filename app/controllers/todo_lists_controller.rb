class TodoListsController < ApplicationController
	 before_action :authorize

	layout 'application'

	def index
		@todos = TodoList.all
	end

	def show
		@todo = TodoList.find params[:id]
	end

	def new
		@todo = TodoList.new
	end

	def create
		@todo = TodoList.new(todo_params)
		if @todo.save
			flash[:success] = "Ajout avec succès"
			redirect_to @todo
		else
			render :new
		end
	end

	def edit
		@todo = TodoList.find params[:id]
	end

	def update
		@todo = TodoList.find(params[:id])

		if @todo.update(todo_params)
			flash[:success] = "Edition avec succès"
			redirect_to @todo
		else
			render :edit
		end
	end

	def destroy
    @todo = TodoList.find(params[:id])
    @todo.destroy

    redirect_to root_path
  end


	private

	def todo_params
		params.require(:todo_list).permit(:title, :description)
	end
end
