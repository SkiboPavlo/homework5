#
class EventsController < ApplicationController
  before_action :load_event, only: [:edit, :update, :destroy, :show, :apply]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit; end

  def show; end

  def apply
    if @event.users.include?(current_user)
      redirect_to event_path
    else
      @event.users << current_user
      @event.save
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      flash[:errors] = @event.errors.messages
      render :new
    end
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to events_path
    else
      flash[:errors] = @event.errors.messages
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def load_event
    @event = Event.find params[:id]
    render file: "#{Rails.root}/public/404.html", status: 404 unless @event
  end

  def event_params
    params.require(:event).permit(:name, :place, :date, :comments, :user_id)
  end
end
