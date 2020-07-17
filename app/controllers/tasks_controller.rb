class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit, :update, :destroy]
  def index
    @tasks=Task.all
  end

  def show
  end

  def new
    @task=Task.new
  end

  def create
    @task=Task.new(task_params)
    if @task.save
      flash[:success] = 'タスクリストへ追加されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクリストへの追加に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:succes] = 'タスクは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy
    
    flash[:succes]= 'タスクを削除しました'
    redirect_to tasks_url
  end
  
  private
  #strong parameter
  
  def set_task
    @task=Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content,:status)
  end
end
