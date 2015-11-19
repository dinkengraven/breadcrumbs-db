class BreadcrumbsController < ApplicationController
  def new
  end

  def create
    breadcrumb = Breadcrumb.new(breadcrumb_params)
    if breadcrumb.save
      content_type :json
      return {message: "successful breadCrumb creation"}.to_json
    end
  end

  def show
    breadcrumb = Breadcrumb.find(params[:id])
    content_type :json
    return {:breadcrumb => breadcrumb}.to_json
  end

  private
    def breadcrumb_params
      params.require(:breadcrumb).permit(:geolocation, :body, :path_to_photo, :found)
    end
end
