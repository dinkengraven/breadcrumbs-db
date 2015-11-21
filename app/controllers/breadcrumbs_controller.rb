class BreadcrumbsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:breadcrumb][:creatorEmail])
    user.created_breadcrumbs.create(breadcrumb_params)
  end

  def return_all_for_user
    breadcrumbs = User.find_by(email: params[:creatorEmail]).created_breadcrumbs
    respond_to do |format|
      format.json { render :json => breadcrumbs }
    end
  end

  def show
    breadcrumb = Breadcrumb.find(params[:id])
    respond_to do |format|
      format.json { render :json => {breadcrumb: breadcrumb} }
    end
  end

  def update
    breadcrumb = Breadcrumb.find(params[:id])
    breadcrumb.update_attribute(:found, true)
  end

  private
    def breadcrumb_params
      params.require(:breadcrumb).permit(:lat, :long, :title, :subtitle, :identifier, :photo, :found)
    end
end
