class SessionsController < ApplicationController
  respond_to :json
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      respond_with do |format|
        format.json { render :json => user }
      end
    end
  end

  def destroy
  end
end
