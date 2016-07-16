class ObservationsController < ApplicationController

  def index
    @protocols = SurveyProtocol.all.includes(:observations => :samples)

    respond_to do |format|
      format.html
      format.csv { send_data Observation.to_csv(@by_site), filename: "all_observations.csv"}
    end
  end

  def new
    @observation = Observation.new
    create_collections
  end

  def create
    @observation = Observation.new(strong_params)
    if @observation.save!
      redirect_to new_observation_sample_path(@observation)
    else
      flash[:message] = "Could not save this observation"
      render :new
    end
  end

  def edit
    @observation = Observation.find(params[:id])
    create_collections
    @selected_site = Site.find(@observation.site_id)
    @selected_protocol = @observation.protocol
  end

  def update
    @observation = Observation.find(params[:id])
    if @observation.update!(strong_params)
      redirect_to show_observation_path(@observation)
    else
      flash[:message] = "Could not update this observation"
      create_collections
      render :edit
    end
  end

  # hijacked RESTful show action to export CSV for a protocol
  def show
    protocol = SurveyProtocol.find_by_id(params[:id])
    respond_to do |format|
      format.csv { send_data protocol.samples_to_csv, filename: "#{protocol.title}-#{protocol.id}.csv" }
    end
  end

  private

  def strong_params
    params.require(:observation).permit(:protocol_id,:site_id)
  end

  def create_collections
    @protocols = SurveyProtocol.all
    @sites = Site.all
  end
end
