class LikesController < ApplicationController
  def create
    @gossip = Gossip.find(params[:gossip_id])

    @like = Like.new(gossip: @gossip)
    @like.user = current_user

    if @like.save
      redirect_to request.referrer
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy

    redirect_to request.referrer
  end
end
