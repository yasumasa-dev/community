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