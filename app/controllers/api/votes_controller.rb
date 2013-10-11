class Api::VotesController < ApplicationController

  def index
    @votes = Vote.where(id: params[:id]).all
    render json: @votes
  end

end
