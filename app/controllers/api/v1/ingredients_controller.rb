module Api
  module V1
    class IngredientsController < ApplicationController
        before_action :set_ingredient, only: [:show,:update,:destroy]

      def index
        render json: Ingredient.all
      end

      def show
        ingredient = Ingredient.find(params[:id])

        ingredient_json = {
          id: ingredient.id,
          name: ingredient.name
        }

        render json: ingredient_json
      end

      def create
        ingredient = Ingredient.create(ingredient_params)
        render json: ingredient
      end

      def update
        ingredient.update(ingredient_params)
        render json: ingredient
      end

      def destroy
        ingredientId = ingredient.id
        ingredient.destroy
        render json: {message:"Ingredient deleted", ingredientId: ingredientId}
      end

      private
      def ingredient_params
        params.permit(:name)
      end

      def set_ingredient
        ingredient = Ingredient.find(params[:id])
      end

    end
  end
end
