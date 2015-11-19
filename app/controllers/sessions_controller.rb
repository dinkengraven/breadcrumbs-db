class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      content_type :json
      return {user: user}.to_json
    end
  end

  def destroy
  end
end
