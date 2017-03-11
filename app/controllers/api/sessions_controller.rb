class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_phone_number(session_params[:phone_number])
    if @user
      login(@user)
      render 'api/users/show'
    else
      render json: ['Phone number not found'], status: 404
    end
  end
  
  private
  def session_params
    params.require(:user).permit(:phone_number)
  end
end
