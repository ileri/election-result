class Admin::ElectionCandidateBoxVotesController < AdminController

  def index
    @ecbvs = ElectionCandidateBoxVotes.all
  end

  def create
    @ecbv = ElectionCandidateBoxVotes.new(ecbv_params)
    @election.save
    Rails.cache.clear
  end

  def update
    @ecbv = set_ecbv
    @ecbv.update(ecbv_params)
    Rails.cache.clear
  end

  def destroy
    @ecbv = set_ecbv
    @ecbv.destroy
    Rails.cache.clear
  end
  
  private

  def set_ecbv
    @ecbv = ElectionCandidateBoxVotes.find(params[:id])
  end

  def ecbv_params
    params.require(:election_candidate_box_vote).permit(:election_id, :candidate_id, :box_id, :vote_count)
  end
end