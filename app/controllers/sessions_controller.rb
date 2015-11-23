class SessionsController < ApplicationController
  respond_to :json

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: {
        status: 200,
        message: "Successfully logged in"
      }.to_json
    end
  end

  def destroy
  end
end
