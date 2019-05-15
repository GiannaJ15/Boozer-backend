module Api
  module V1
    class CocktailsController < ApplicationController



      def index
        render json: Cocktail.all
      end

# set_cocktail wasn't working on "show"
      def show
        cocktail = Cocktail.find(params[:id])

        cocktail_json = {
          id: cocktail.id,
          name: cocktail.name,
          description: cocktail.description,
          instructions: cocktail.instructions,
          source: cocktail.source,
          proportions: cocktail.proportions.map do |prop|
            {
              id: prop.id,
              ingredient_name: prop.ingredient.name,
              amount: prop.amount
            }
          end
        }

        render json: cocktail_json
      end

      def create
        cocktail = Cocktail.create(cocktail_params)
        render json: cocktail
      end

      def update
        cocktail = Cocktail.find(params[:id])
        cocktail.update(cocktail_params)
        render json: cocktail
      end

      def destroy
        cocktail = Cocktail.find(params[:id])
        cocktailId = cocktail.id
        cocktail.destroy
        render json: {message:"Cocktail deleted", cocktailId: cocktailId}
      end

      private
      def cocktail_params
        params.permit(:name, :description, :instructions, :source, :proportions)
      end


    end
  end
end
