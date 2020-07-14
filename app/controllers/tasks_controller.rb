class TasksController < ApplicationController
  def index
    @tasks=Task.all
  end

  def show
    @task=Task.find(params[:id])
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
    @task=Task.find(params[:id])
    if @task.save
      flash[:success] = 'タスクリストを修正しました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクリストの修正に失敗しました'
      render :new
    end
  end

  def update
  end

  def destroy
  end
end
