class BreadcrumbsController < ApplicationController
  def new
  end

  def create
    breadcrumb = Breadcrumb.new(breadcrumb_params)
    breadcrumb.save
  end

  def show
    breadcrumb = Breadcrumb.find(params[:id])
    respond_to do |format|
      format.json { render :json => breadcrumb }
    end
  end

  private
    def breadcrumb_params
      params.require(:breadcrumb).permit(:geolocation, :body, :path_to_photo, :found)
    end
end
