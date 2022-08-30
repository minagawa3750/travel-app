class RoomsController < ApplicationController
 before_action :authenticate_user!, except: [:search, :index]

  def index
    @rooms = Room.all
  end

  def new
    @rooms = Room.new
  end

  def create
    @rooms = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :image))
    @rooms.user_id = current_user.id
   if @rooms.save
     flash[:notice] = "部屋を新規登録しました"
     redirect_to :rooms
   else
     render "new"
   end
  end

   def show
    @users = current_user
    @rooms = Room.find(params[:id])
    @reservations = Reservation.new
   end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
   if params[:address].present?
     @rooms = Room.where('address LIKE ?', "%#{params[:address]}%")
   elsif params[:keyword].present?
     @rooms = Room.where('name LIKE ? OR price LIKE ? OR introduction LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
   else
     @rooms = Room.all
   end
  end




end
