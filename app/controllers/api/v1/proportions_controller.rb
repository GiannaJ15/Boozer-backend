module Api
  module V1
    class ProportionsController < ApplicationController

      def index
        render json: Proportion.all
      end


      def create
        proportion = Proportion.create(proportion_params)
        render json: proportion
      end

      def delete
        proportion = Proportion.find(params[:id])
        proportion.destroy      
      end


      private
      def proportion_params
        params.permit(:ingredient_id, :cocktail_id, :amount)
      end

    end
  end
end
