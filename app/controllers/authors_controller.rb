class AuthorsController < ApplicationController
  def index
    @authors = Author.all
    @todos = Todo.all
    render :index
  end

  def create
    @author = params.require(:author).permit(:name, :age)
    Author.create(@author)
    redirect_to "/"
  end

end