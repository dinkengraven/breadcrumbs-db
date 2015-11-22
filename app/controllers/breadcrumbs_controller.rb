class BreadcrumbsController < ApplicationController
  before_action :set_breadcrumb, only: [:show, :update, :destroy]
  before_filter :restrict_access

  def new
  end

  def create
    user = User.find_by(email: params[:breadcrumb][:creatorEmail])
    breadcrumb = Breadcrumb.new(breadcrumb_params)
    breadcrumb.save
    user.created_breadcrumbs << breadcrumb
  end

  def return_all_for_user
    breadcrumbs = User.find_by(email: params[:creatorEmail]).created_breadcrumbs
    respond_to do |format|
      format.json { render :json => breadcrumbs }
    end
  end

  def show
    respond_to do |format|
      format.json { render :json => {breadcrumb: breadcrumb} }
    end
  end

  def update
    breadcrumb.update_attribute(:found, true)
  end

  def destroy
    breadcrumb.destroy
  end

  private
    def breadcrumb_params
      params.require(:breadcrumb).permit(:lat, :long, :title, :subtitle, :identifier, :photo, :found, :image_data)
    end

    def set_breadcrumb
      breadcrumb = Breadcrumb.find(params[:id])
    end

    def restrict_access
      api_key = ApiKey.find_by(access_token: params[:access_token])
      head :unauthorized unless api_key
    end
end
