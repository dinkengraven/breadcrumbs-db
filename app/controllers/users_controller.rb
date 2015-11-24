class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      render status: 200, json: {
        message: "Successfully registered."
      }.to_json
    end
  end

  def show
    user = User.find(params[:id])
    respond_to do |format|
      format.json { render :json => {user: user.id} }
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
