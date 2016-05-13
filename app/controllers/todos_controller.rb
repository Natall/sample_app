class TodosController < ApplicationController

  def index
    @todos = Todo.where(user_id: current_user.id).order(id: :desc)
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

  def update
    puts params.inspect
    puts todo_params.inspect
    @todo = Todo.find(params[:id])
    @todo.update_attributes(todo_params)
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:item, :mark)
  end

  def edit
    @todo = Todo.find(params[:id])
  end

end

