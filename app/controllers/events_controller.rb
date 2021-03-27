class EventsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to root_url, notice: "イベントを作成しました"
    else
      flash.now[:alert] = "イベントを作成できませんでした"
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments
    @comment = Comment.new
  end

  def edit
    @event = current_user.events.find(params[:id])
    @event.image.cache!
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update(event_params)
      redirect_to event_url(@event.id), notice: "イベントを編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to root_url, notice: "イベントを削除しました"
  end

  private

    def event_params
      params.require(:event).permit(:event_name, :description, :address,
                                    :event_start_at, :event_end_at, :event_team,
                                    :capacity, :image, :image_cache, :latitude, :longitude, :title)
    end

    def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to root_url if @event.nil?
    end
end
