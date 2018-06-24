class Admin::ElectionPartyBoxVotesController < AdminController

  def index
    @epbvs = ElectionPartyBoxVote.all
  end

  def create
    @epbv = ElectionPartyBoxVote.new(epbv_params)
    @election.save
    Rails.cache.clear
  end

  def update
    @epbv = set_epbv
    @epbv.update(epbv_params)
    Rails.cache.clear
  end

  def destroy
    @epbv = set_epbv
    @epbv.destroy
    Rails.cache.clear
  end
  
  private

  def set_epbv
    @epbv = ElectionPartyBoxVotes.find(params[:id])
  end

  def epbv_params
    params.require(:election_party_box_vote).permit(:election_id, :party_id, :box_id, :vote_count)
  end
end