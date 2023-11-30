class AnimalsController < ApplicationController
    def index
        @animals = Animal.all
        render json: @animals
    end
    
      def show
        animal = Animal.find(params[:id])
        render json: @animals
      end
    
      def create
        @animal = Animal.new(animal_params)
        if animal.valid?
            render json: animal
        else
          render json: animal.errors
        end
      end
    
    
      def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
        if animal.valid?
            render json: @animal
        else
          render json: @animal.errors
        end
      end
    
      def destroy
        animal = Animal.find(params[:id])
        if animal.destroy
            render json: @animal
        else 
            render json: @animal
        end
      end
    
      private
    
      def set_animal
        @animal = Animal.find(params[:id])
      end
    
      def animal_params
        params.require(:animal).permit(:common_name, :scientific_binomial)
      end
    
end
