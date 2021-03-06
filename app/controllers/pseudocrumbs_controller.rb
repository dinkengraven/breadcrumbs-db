class PseudocrumbsController < ApplicationController
  before_filter :restrict_access

  def new
  end

  def create
    user = User.find_by(email: params[:pseudocrumb][:creatorEmail])
    user.created_pseudocrumbs.create(pseudocrumb_params)
  end

  def return_all_for_user
    pseudocrumbs = User.find_by(email: params[:creatorEmail]).created_pseudocrumbs
    respond_to do |format|
      format.json { render :json => pseudocrumbs }
    end
  end

  def show
    pseudocrumb = Pseudocrumb.find(params[:id])
    respond_to do |format|
      format.json { render :json => {pseudocrumb: pseudocrumb} }
    end
  end

  def update
    pseudocrumb = Pseudocrumb.find(params[:id])
    pseudocrumb.update_attribute(:found, true)
  end

  private
    def pseudocrumb_params
      params.require(:pseudocrumb).permit(:lat, :long, :identifier, :title, :subtitle)
    end

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(access_token: token)
      end
    end
end
