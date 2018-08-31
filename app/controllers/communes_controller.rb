class CommunesController < ApplicationController
  before_action :set_commune, only: [:show, :update]

  def index
    respond_to do |format|
      format.html {
        render status: :not_acceptable, body: nil
      }
      format.json { 
        communes = Commune.all
        render json: communes, status: :created
      }
    end
  end

  def create
    head :forbidden
  end

  def show
    head :ok if @commune
  end

  def update
    head :no_content if @commune.update(commune_params)
  rescue ActionController::ParameterMissing => ex
    head :bad_request
  end

  private

  def set_commune
    @commune ||= Commune.find_by_code_insee(params[:id])
    head :not_found if @commune.nil?
  end

  def commune_params
    params.require(:commune).permit(:name)
  end
end