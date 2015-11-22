class BreadcrumbsController < ApplicationController
  # before_action :set_breadcrumb, only: [:update, :destroy]

  def new
  end

  def create
    creator = User.find_by(email: params[:breadcrumb][:creatorEmail])
    breadcrumb = Breadcrumb.new(breadcrumb_params)
    breadcrumb.save
    creator.created_breadcrumbs << breadcrumb

    if params[:breadcrumb][:receiverEmail]
      receiver = User.find_by(email: params[:breadcrumb][:receiverEmail])
      receiver.received_breadcrumbs << breadcrumb
    else
      creator.received_breadcrumbs << breadcrumb
    end
  end

  def return_all_for_user
    breadcrumbs = User.find_by(email: params[:receiverEmail]).received_breadcrumbs
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
    # breadcrumb.update_attribute(:found, true)
  end

  def destroy
    breadcrumb = Breadcrumb.find_by(identifier: params[:identifier])
    breadcrumb.destroy
  end

  private
    def breadcrumb_params
      params.require(:breadcrumb).permit(:lat, :long, :title, :subtitle, :identifier, :photo, :found, :image_data)
    end

    def set_breadcrumb
      breadcrumb = Breadcrumb.find_by(identifier: params[:identifier])
    end
end
