#
class CommentsController < ApplicationController
  def new
    @event = Event.find params[:event_id]
    @comment = @event.comments.build
  end

  def create
    @event = Event.find params[:event_id]
    @comment = @event.comments.build(comment_params)
    if @comment.save
      redirect_to event_path(@comment.event, @comment)
    else
      flash[:errors] = @comment.errors.messages
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :event_id)
  end
end
