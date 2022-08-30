class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @rooms = Room.find(params[:reservation][:room_id])
    @reservations = Reservation.new(reservation_params)
    @total_price = @rooms.price * @reservations.member * (@reservations.end_date - @reservations.start_date).to_i
    @days = (@reservations.end_date - @reservations.start_date).to_i
  end

  def create
    @reservations = Reservation.new(reservation_params)
    @rooms = Room.find(params[:reservation][:room_id])
    @total_price = @rooms.price * @reservations.member * (@reservations.end_date - @reservations.start_date).to_i
    @days = (@reservations.end_date - @reservations.start_date).to_i
    if @reservations.save
      flash[:notice] = "予約が完了しました"
      redirect_to reservation_path(@reservations.id)
    else
      render "new"
    end
 end

   def show
     @reservations = Reservation.find(params[:id])
     @total_price = @reservations.room.price * @reservations.member * (@reservations.end_date - @reservations.start_date).to_i

   end

  def edit
  end

  def update
  end

  def destroy
  end

  private
 def reservation_params
   params.require(:reservation).permit(:start_date, :end_date, :member, :room_id, :user_id)
 end
end
