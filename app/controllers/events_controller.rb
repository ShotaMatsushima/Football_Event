class EventsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @events = Event.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @event = current_user.events.find(params[:id])
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to event_path(@event.id)
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to request.referrer || root_url
  end

  private

    def event_params
      params.require(:event).permit(:event_name, :description, :event_address,
                                    :event_at, :event_team, :capacity)
    end

    def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to root_url if @event.nil?
    end
end
