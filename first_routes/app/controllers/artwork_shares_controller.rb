class ArtworkSharesController < ApplicationController
  def create
    @artwork_share = ArtworkShare.new(artwork_shares_params)
    if @artwork_share.save
      render json: @artwork_share
    else
      render json: @artwork_share.errors.full_messages, status: 422
    end
  end

  private
  def artwork_shares_params
    params.require(:artwork_shares).permit(:viewer_id, :artwork_id)
  end
end
