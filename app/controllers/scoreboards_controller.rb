class ScoreboardsController < ApplicationController
    def index
        scoreboards = Scoreboard.all
        render json: scoreboards
    end
end
