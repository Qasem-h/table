class DashboardController < ApplicationController
  include TablesHelper

  def index
    country = params[:country] || 'england'
    @leagues = League.where(country: country).joins(:matches).includes(matches: [odd_types: :bookmaker])
    @betslip = Betslip.new
  end
end
