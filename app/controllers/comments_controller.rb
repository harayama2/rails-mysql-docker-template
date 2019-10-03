class CommentsController < ApplicationController
  before_action :set_task
  before_action :set_comment, only: %i[edit update destroy]

  def edit
    # noop
  end

  def create
    @comment = @task.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @task, notice: 'コメントを追加しました。'
    else
      render 'tasks/show'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @task, notice: 'コメントを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to task_url(@task), notice: 'コメントを削除しました。'
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_comment
    @comment = @task.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
