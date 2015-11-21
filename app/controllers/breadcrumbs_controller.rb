class BreadcrumbsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:breadcrumb][:creatorEmail])
    user.created_breadcrumbs.create(breadcrumb_params)
  end

  def show
    breadcrumb = Breadcrumb.find(params[:id])
    respond_to do |format|
      format.json { render :json => {breadcrumb: breadcrumb} }
    end
  end

  private
    def breadcrumb_params
      params.require(:breadcrumb).permit(:lat, :long, :title, :subtitle, :identifier, :photo, :found)
    end
end
