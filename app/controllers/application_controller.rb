class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def sign_in(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end


  def require_log_in
    render json: { base: ['invalid credentials'] } unless logged_in?
  end

  def get_restaurant(restaurant_id)
    def create
      restaurant = nil
      offset = 12140
      min = 0
      max = 24281

      until restaurant || offset == 0 || offset > max
        url = URI("https://platform.otqa.com/sync/listings")
        url.query = "offset=#{offset}&country=US"

        http_net = Net::HTTP.new(url.host, url.port)
        http_net.use_ssl = true

        response = http_net.start do |http|
          request = Net::HTTP::Get.new(url)
          request["Authorization"] = "Bearer 27037c67-f394-4cfd-ab51-069ac71132fb"
          request["Content-type"] = "application/json"

          http.request(request)
        end

        listings = JSON.parse(response.body)['items']

        if listings.first['rid'].to_i > restaurant_id.to_i
          max = offset
          offset -= (offset - min) / 2
          next
        else
          min = offset
          offset += (max - offset) / 2
        end


        listings.each do |listing|
          restaurant = listing if listing['rid'] == restaurant_id
        end
      end

      restaurant
    end
  end
end
