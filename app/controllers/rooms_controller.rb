class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    #these two variables use the scopes defined in the respective models - rather than having to type that stuff out over and over again.
    @room = Room.new
    @rooms = Room.public_rooms

    
    @users = User.all_except(current_user)
    render "index"
  end
  def show 
    @single_room = Room.find(params[:id])
    @room = Room.new
    @rooms = Room.public_rooms

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)
    
    @users = User.all_except(current_user)
    render "index"
  end
  def create
    @room = Room.create(name: params["room"]["name"])
  end

end
