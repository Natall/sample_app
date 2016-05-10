class TodosController < ApplicationController
  def index
    @todos = Todo.where(user_id: current_user.id)
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.build(todo_params)
    @todo.save
    redirect_to todos_path
  end

  def show
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  private

  def todo_params
    params.require(:todo).permit(:item)
  end

  def edit
    @todo = Todo.find(params[:id])

  end
  def update
    @todo = Todo.find(params[:id])
    @todo.update
    end
end

