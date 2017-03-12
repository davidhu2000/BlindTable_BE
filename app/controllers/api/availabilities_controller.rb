class Api::AvailabilitiesController < ApplicationController
  def create
    p params

    url = URI("https://platform.otqa.com/availability")
    url.query = "latitude=37.791305&longitude=-122.3959292&party_size=4&radius=5&forward_minutes=60&backward_minutes=0&start_date_time=2017-03-13T20:00&include_unavailable=false"

    http_net = Net::HTTP.new(url.host, url.port)
    http_net.use_ssl = true

    response = http_net.start do |http|
      request = Net::HTTP::Get.new(url)
      request["Authorization"] = "Bearer 27037c67-f394-4cfd-ab51-069ac71132fb"
      request["Content-type"] = "application/json"

      http.request(request)
    end

    p response.body
  end


  def availability_params
    params
      .require(:availability)
      .permit(
        :radius,
        :party_size,
        :forward_minutes,
        :backward_minutes,
        :start_date_tiime,
        :longitude,
        :latitude
      )
  end
end
