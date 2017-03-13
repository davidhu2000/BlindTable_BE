class Api::AvailabilitiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    # radius = availability_params['radius'] || "5"
    # party_size = availability_params['party_size'] || "4"
    # forward_minutes = availability_params['forward_minutes'] || "60"
    # backward_minutes = availability_params['backward_minutes'] || "0"
    # start_date_time = availability_params['start_date_tiime'] || "2017-03-12T18:00"
    # longitude = availability_params['longitude'] || "-122.3959292"
    # latitude = availability_params['latitude'] || "37.791305"
    #
    # url = URI("https://platform.otqa.com/availability")
    # url.query = "latitude=#{latitude}&longitude=#{longitude}&party_size=#{party_size}&radius=#{radius}&forward_minutes=#{forward_minutes}&backward_minutes=#{backward_minutes}&start_date_time=#{start_date_time}&include_unavailable=false"
    #
    # http_net = Net::HTTP.new(url.host, url.port)
    # http_net.use_ssl = true
    #
    # response = http_net.start do |http|
    #   request = Net::HTTP::Get.new(url)
    #   request["Authorization"] = "Bearer 27037c67-f394-4cfd-ab51-069ac71132fb"
    #   request["Content-type"] = "application/json"
    #
    #   http.request(request)
    # end
    #
    # @availability = JSON.parse(response.body)["availabilities"]
    #
    # r_url = URI("https://platform.otqa.com/availability")


    offset = 100

    url = URI("https://platform.otqa.com/sync/listings")

    http_net = Net::HTTP.new(url.host, url.port)
    http_net.use_ssl = true

    @availability = Hash.new

    until @availability.keys.count > 10
      url.query = "offset=#{offset}&country=US"

      response = http_net.start do |http|
        request = Net::HTTP::Get.new(url)
        request["Authorization"] = "Bearer 27037c67-f394-4cfd-ab51-069ac71132fb"
        request["Content-type"] = "application/json"

        http.request(request)
      end

      listings = JSON.parse(response.body)['items']

      listings.each do |listing|
        if listing['city'] == 'San Francisco'
          @availability[listing['rid']] = listing
        end
      end
      p @availability.keys.count

      offset += 100
    end


    render json: @availability
  end


  # def availability_params
  #   # params
  #   #   .require(:availability)
  #   #   .permit(
  #   #     :radius,
  #   #     :party_size,
  #   #     :forward_minutes,
  #   #     :backward_minutes,
  #   #     :start_date_time,
  #   #     :longitude,
  #   #     :latitude
  #   #   )
  # end
end
