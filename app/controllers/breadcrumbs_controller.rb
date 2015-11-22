class BreadcrumbsController < ApplicationController
  before_action :set_breadcrumb, only: [:show, :update, :destroy]

  def new
  end

  def create
    creator = User.find_by(email: params[:breadcrumb][:creatorEmail])
    breadcrumb = Breadcrumb.new(breadcrumb_params)
    breadcrumb.save
    creator.created_breadcrumbs << breadcrumb

    if params[:breadcrumb][:receiverEmail] || params[:breadcrumb][:receiverEmail] == ""
      receiver = User.find_by(params[:breadcrumb][:receiverEmail])
      receiver.received_breadcrumbs << breadcrumb
    else
      creator.received_breadcrumbs << breadcrumb
    end
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
end
