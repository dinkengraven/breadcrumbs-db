class PseudocrumbsController < ApplicationController
  def new
  end

  def create
    pseudocrumb = Pseudocrumb.new(pseudocrumb_params)
    pseudocrumb.save
  end

  def show
    pseudocrumb = Pseudocrumb.find(params[:id])
    respond_to do |format|
      format.json { render :json => {pseudocrumb: pseudocrumb} }
    end
  end

  private
    def pseudocrumb_params
      params.require(:pseudocrumb).permit(:lat, :long, :identifier, :message)
    end
end
