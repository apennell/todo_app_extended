class TodosController < ApplicationController

  def index
    @todos = Todo.all
    render :index
  end

  def create

    @todo = params.require(:todo).permit(:description)
    @todo[:completed] = false

    Todo.create(@todo)
    redirect_to "/"
  end

  def complete
    params[:todos_checkbox].each do |check|
      todo_id = check
      todo = Todo.find_by_id(todo_id)
      todo.update_attribute(:completed, !todo.completed)
    end
    redirect_to "/"
  end

  def delete
    @todo = Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to "/"
  end

  def delete_complete
    @completed = Todo.where(:completed => true)
  end

  def destroy_complete
    @completed = Todo.where(:completed => true)
    @completed.destroy
    redirect_to "/"
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    todo = params.require(:todo).permit(:description)
    if @todo.update(todo)
      redirect_to todos_path
    else
      render "/edit"
    end
  end
end
