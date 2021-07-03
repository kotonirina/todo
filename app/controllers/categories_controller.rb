class CategoriesController < ApplicationController
	def create
    @todo = TodoList.find(params[:todo_list_id])
    @category = @todo.categories.create(category_params)
    redirect_to todo_list_path(@todo)
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
