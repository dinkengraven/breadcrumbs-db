class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render status: 200, json: {
        message: "Successfully logged in.",
        api_key: user.api_key.access_token,
        first_name: user.first_name.capitalize
      }.to_json
    end
  end

  def destroy
  end
end
