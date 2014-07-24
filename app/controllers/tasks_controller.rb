class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  def new
    @task = Task.new
    @user = User.first
    @recipients = @user.recipients
  end

  def create
    @task = Task.new(task_params)

    @task.user = User.first

    if @task.save
      redirect_to tasks_url
    else
      render :new
    end
  end

  def receive_text

    @message_body = params["Body"]
    # "13"
    @from_number = params["From"]

    @task = Task.find(@message_body)

    @task.completed = true

    @task.save

    render nothing: true

    # SMSLogger.log_text_message @from_number, @message_body
  end

  def edit
  end

  private
  def task_params
    params.require(:task).permit(:activity, :message, :complete_date, :recipient_id)
  end
end
