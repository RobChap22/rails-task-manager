class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(strong_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render 'new.html.erb'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(strong_params)
      redirect_to task_path(@task)
    else
      render 'edit.html.erb'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def strong_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
