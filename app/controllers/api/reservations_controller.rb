class Api::ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    # slot_lock_url = URI("https://platform.otqa.com/booking/slot_locks")
    #
    # http_net = Net::HTTP.new(slot_lock_url.host, slot_lock_url.port)
    # http_net.use_ssl = true
    #
    # slot_lock_response = http_net.start do |http|
    #   request = Net::HTTP::Post.new(slot_lock_url)
    #   request["Authorization"] = "Bearer 27037c67-f394-4cfd-ab51-069ac71132fb"
    #   request["Content-type"] = "application/json"
    #   request.body = {
    #     party_size: reservation_params["party_size"],
    #     date_time: reservation_params["date_time"],
    #     restaurant_id: reservation_params["restaurant_id"]
    #   }.to_json
    #
    #   http.request(request)
    # end
    #
    # slot_lock_response_body = JSON.parse(slot_lock_response.body)
    #
    # reservation_url = URI("https://platform.otqa.com/booking/reservations")
    #
    # http_net = Net::HTTP.new(reservation_url.host, reservation_url.port)
    # http_net.use_ssl = true
    #
    faker_first_name = Faker::Food.ingredient
    faker_last_name = Faker::Food.ingredient
    #
    # reservation_body = {
    #   restaurant_id: reservation_params["restaurant_id"],
    #   reservation_token: slot_lock_response_body["reservation_token"],
    #   first_name: "Blind",
    #   last_name: "Table",
    #   email_address: "blindtableapp@gmail.com",
    #   phone: {
    #     number: "8008880000",
    #     country_code: "US",
    #     phone_type: "Mobile"
    #   },
    #   is_third_party: true,
    #   diner_info: {
    #     first_name: faker_first_name,
    #     last_name: faker_last_name,
    #     phone: {
    #       phone_type: "Mobile",
    #       country_code: "US",
    #       number: "8008880000"
    #     }
    #   }
    # }.to_json
    #
    # reservation_response = http_net.start do |http|
    #   request = Net::HTTP::Post.new(reservation_url)
    #   request["Authorization"] = "Bearer 27037c67-f394-4cfd-ab51-069ac71132fb"
    #   request["Content-type"] = "application/json"
    #
    #   request.body = reservation_body
    #
    #   http.request(request)
    # end
    #
    # reservation_response_body = JSON.parse(reservation_response.body)
    #
    # @reservation = Reservation.new(
    #   rid: reservation_params["restaurant_id"],
    #   confirmation_number: reservation_response_body["confirmation_number"],
    #   first_name: faker_first_name,
    #   last_name: faker_last_name
    # )
    @reservation = Reservation.new(
      rid: reservation_params["restaurant_id"],
      confirmation_number: Faker::Number.number(10),
      date_time: reservation_params["date_time"],
      party_size: reservation_params["party_size"],
      first_name: faker_first_name,
      last_name: faker_last_name
    )

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
    debugger
    if params[:time]
      @reservations = Reservation.all.where('LOWER(name) ~ LOWER(?)', params[:time])
    else
      @reservations = Reservation.all
    end
    render 'api/reservations/index'
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
    render 'api/reservations/index'
  end

  private
  def reservation_params
    params
      .require(:reservation)
      .permit(
        :restaurant_id,
        :date_time,
        :party_size,
      )
  end
end
