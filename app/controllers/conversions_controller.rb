class ConversionsController < ApplicationController
    def index
        conversions = Conversion.all
        render json: conversions, include: [:country, :item]
    end
end
