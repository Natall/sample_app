class TodosController < ApplicationController

  def new
    @todo = Todo.new
  end

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
    puts 'im here'
    @todos = Todo.all
  end

  def update
    puts 'request'
    puts request.referer.inspect
    @todo = Todo.find(params[:id])
    @todo.update_attributes(todo_params)
    redirect_to request.referer
  end

  def active
    @todos = Todo.where(user_id: current_user.id).where(mark: false).order(id: :desc)
    @todo = Todo.new
    render :index
  end

  def completed
    @todos = Todo.where(user_id: current_user.id).where(mark: true).order(id: :desc)
    @todo = Todo.new
    render :index
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to request.referer
  end

  def delete_completed
    @todo= Todo.all.where(user_id: current_user.id).where(mark: true)
    @todo.destroy_all
    redirect_to request.referer
    end

  private

  def todo_params
    params.require(:todo).permit(:item, :mark)
  end

  def edit
    @todo = Todo.find(params[:id])
  end

end

