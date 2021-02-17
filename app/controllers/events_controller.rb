class EventsController < ApplicationController
  def index
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to event_path(@event.id)
    else
      render 'new'
    end
  end

  def show
    @event = current_user.events.find(params[:id])
  end

  def edit
  end

  private

    def event_params
      params.require(:event).permit(:event_name, :description, :event_address,
                                  :event_at, :event_team, :capacity)
    end
end
