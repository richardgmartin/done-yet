class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  def new
    @task = Task.new
    @taskmaster = Taskmaster.first
    @taskers = @taskmaster.taskers
  end

  def create
    @task = Task.new(task_params)

    @task.taskmaster = Taskmaster.first

    if @task.save
      redirect_to tasks_url
    else
      render :new
    end
  end

  def edit
  end

  private
  def task_params
    params.require(:task).permit(:activity, :message, :complete_date, :tasker_id)
  end
end
