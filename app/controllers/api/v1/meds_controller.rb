module Api
  module V1
    class MedsController < ApplicationController

      def search
        # TODO: look into securing this
        # TODO: also into how to deal with 1 of 2010 results, total pages, etc
        results = Seeker.find(params[:query].to_s, params[:page].to_i, params[:per_page].to_i)
        render json: results
      end

      def show
        med = Med.find(params[:id].to_i)
        render json: med
      end
    end
  end
end