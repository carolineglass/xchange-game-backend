class ScoreboardsController < ApplicationController
    def index
        scoreboards = Scoreboard.all
        render json: scoreboards
    end

    def show
        scoreboard = Scoreboard.find(params[:id])
        render json: scoreboard
    end

    def create
        scoreboard = Scoreboard.create(scoreboard_params)
        render json: scoreboard
        
    end

    def update
        scoreboard = Scoreboard.find(params[:id])
        scoreboard.update(score_param)
        render json: scoreboard
    end

    private

    def scoreboard_params
        params.require(:scoreboard).permit(:username, :score)
    end

    def score_param
        params.require(:scoreboard).permit(:score)
    end
    
end
