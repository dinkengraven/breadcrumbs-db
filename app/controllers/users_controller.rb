class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {
        status: 200,
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
