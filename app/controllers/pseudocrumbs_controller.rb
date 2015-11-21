class PseudocrumbsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    pseudocrumb = Pseudocrumb.new(pseudocrumb_params)
    pseudocrumb.save

    user.created_pseudocrumbs << pseudocrumb
    user.received_pseudocrumbs << pseudocrumb
  end

  def show
    pseudocrumb = Pseudocrumb.find(params[:id])
    respond_to do |format|
      format.json { render :json => {pseudocrumb: pseudocrumb} }
    end
  end

  private
    def pseudocrumb_params
      params.require(:pseudocrumb).permit(:lat, :long, :identifier, :title, :subtitle)
    end
end
