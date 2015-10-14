class BetslipsController < ApplicationController
  def create
    betslip = Betslip.new(betslip_params)
    betslip.save
    redirect_to root_path
  end

  private

  def betslip_params
    params.require(:betslip).permit(games_attributes: [:home, :away, :match_id])
  end
end
