class AnimalsController < ApplicationController
  # before_action :set_animal, only: [:show, :update, :destroy]

    def index
        @animals = Animal.all
        render json: @animals
    end
    
      def show
        @sightings = @animal.sightings
        render json: { animal: @animal, sightings: @sightings }
      end
    
      def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal, status: :created
        else
          render json: animal.errors, status: :unprocessable_entity
      end
    end
  
    
      def update
       if animal.update(animal_params)
            render json: @animal
        else
          render json: @animal.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        if animal.destroy
            render json: @animal
        else 
            render json: @animal.errors, status: :unprocessable_entity
        end
      end
    
      private
    
      # def set_animal
      #   @animal = Animal.find(params[:id])
      # end
    
      def animal_params
        params.require(:animal).permit(:common_name, :scientific_binomial)
      end
    
end
