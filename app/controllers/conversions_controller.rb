class ConversionsController < ApplicationController
    def index
        conversions = Conversions.all
        render json: conversions, include: [:country, :item]
      end
end
