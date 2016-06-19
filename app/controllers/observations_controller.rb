class ObservationsController < ApplicationController
  def new
    @observation = Observation.new
    create_collections
  end

  def create
    @observation = Observation.new(strong_params)
    if @observation.save!
      redirect_to edit_observation_path(@observation)
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

  private

  def strong_params
    params.require(:observation).permit(:protocol_id,:site_id)
  end

  def create_collections
    @protocols = SurveyProtocol.all
    @sites = Site.all
  end
end
