class TasksController < ApplicationController
  before_action :find_paramsid, only: [:show, :edit, :update, :destroy]

  def index
    @task = Task.all
  end

  def show
    find_paramsid
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def edit
    find_paramsid
  end

  def update
    find_paramsid
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    find_paramsid
    @task.destroy
    redirect_to tasks_path
  end

  private

  def find_paramsid
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
