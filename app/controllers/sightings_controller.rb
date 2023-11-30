class SightingsController < ApplicationController
    before_action :set_sighting, only: [:update, :destroy]

    def create
      @sighting = Sighting.new(sighting_params)
      if @sighting.save
        render json: @sighting, status: :created
      else
        render json: @sighting.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @sighting.update(sighting_params)
        render json: @sighting
      else
        render json: @sighting.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @sighting.destroy
      render json: @sighting
    end
  
    private
  
    def set_sighting
      @sighting = Sighting.find(params[:id])
    end
  
    def sighting_params
      params.require(:sighting).permit(:latitude, :longitude, :date, :animal_id)
    end
end
