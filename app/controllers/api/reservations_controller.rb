class Api::ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      ReservationJoin.create(reservation_id: @reservation.id, user_id: current_user.id)
      render 'api/reservations/show'
    else
      render json: @reservation.errors.full_messages, status: 422
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    render 'api/reservations/show'
  end

  def index
    if params[:searchInput]
      @reservations = Reservation.all.where('LOWER(name) ~ LOWER(?)', params[:searchInput])
    else
      @reservations = Reservation.all
    end
    render 'api/reservations/index.json.jbuilder'
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      render 'api/reservations/show'
    else
      render json: @reservation.errors.full_messages, status: 422
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    ReservationJoin.find_by(reservation_id: @reservation.id, user_id: current_user.id).delete
    @reservation.delete
    # render 'api/reservations/index'
  end

  private
  def reservation_params
    params.require(:reservation).permit(:name, :address, :state, :city, :zip, :time)
  end
end
