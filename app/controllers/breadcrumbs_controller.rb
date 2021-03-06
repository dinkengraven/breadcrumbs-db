class BreadcrumbsController < ApplicationController
  before_filter :restrict_access

  def new
  end

  def create
    creator = User.find_by(email: params[:breadcrumb][:creatorEmail])
    breadcrumb = Breadcrumb.new(breadcrumb_params)
    breadcrumb.save
    creator.created_breadcrumbs << breadcrumb
    breadcrumb.set_creator_email

    receiver_email = params[:breadcrumb][:receiverEmail]

    if receiver_email == "" || receiver_email == nil
      creator.received_breadcrumbs << breadcrumb
    else
      receiver = User.find_by(email: receiver_email)
      receiver.received_breadcrumbs << breadcrumb
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
  end

  def destroy
    breadcrumb = Breadcrumb.find_by(identifier: params[:identifier])
    breadcrumb.destroy
  end

  private
    def breadcrumb_params
      params.require(:breadcrumb).permit(:lat, :long, :title, :subtitle, :identifier, :photo, :found, :image_data)
    end

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(access_token: token)
      end
    end
end
