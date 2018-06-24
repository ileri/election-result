module AdminHelper
  def box_votes(box)
    if(@election.election_type.option == 'party')
      ElectionPartyBoxVote.where(election: @election, box: box)
    elsif(@election.election_type.option == 'candidate')
      ElectionCandidateBoxVote.where(election: @election, box: box)
    end
  end
end
