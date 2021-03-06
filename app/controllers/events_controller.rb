class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)
    if @event.save 
      redirect_to root_path 
    else
      render :new 
    end
  end

  def show
    @event = Event.includes(:user).find(params[id])
  end

  def edit
    @event = Event.find(params[:id])
    unless current_user == @event.user
      redirect_to root_path
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(events_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @event.user_id
      @event.destroy
    end
    redirect_to root_path
  end

  private
  def events_params
    params.require(:event).permit(:title,
                                 :image, 
                                 :explanation,
                                 :category_id, 
                                 :locationtion_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
    redirect_to action: ：index
    end
  end

end