class EventsController < ApplicationController
  def index
  end

  def new
    @event = current_user.events.build
  end

  def show
  end

  def edit
  end

  private

    def event_params
      params.require(:event).permit(:event_name, :description, :event_address,
                                  :event_at, :event_team, :capacity)
    end
end
