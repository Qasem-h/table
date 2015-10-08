class GamesController < ApplicationController
  def index
  end
  
  def create
    @game = Game.new(params_transactions)
    	if @game.save
        redirect_to :back
    	else
        render 'games/error'
    	end
  end
  
  private
  
  def params_transactions
    params.require(:game).permit(:home, :match_id)
  end
  
end
