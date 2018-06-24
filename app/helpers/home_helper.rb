module HomeHelper
  def box_votes(box)
    if(@election.election_type.option == 'party')
      ElectionPartyBoxVote.where(election: @election, box: box)
    elsif(@election.election_type.option == 'candidate')
      ElectionCandidateBoxVote.where(election: @election, box: box)
    end
  end

  def box_result(election, box)
    if election.election_type.option == 'party'
      box_party_result(election, box)
    elsif election.election_type.option == 'candidate'
      box_candidate_result(election, box)
    end
  end

  def box_party_result(election, box)
    string = ""
    election.parties.each do |party|
      string << "#{party.short_name}: <strong>#{ElectionPartyBoxVote.where(election: election, party: party, box: box).first.vote_count}</strong>\n" if ElectionPartyBoxVote.where(election: election, party: party, box: box).present?
    end
    string
  end

  def box_candidate_result(election, box)
    string = ""
    election.candidates.each do |candidate|
      string << "#{candidate.name}: #{ElectionCandidateBoxVote.where(election: election, candidate: candidate, box: box).first.vote_count}\n" if ElectionCandidateBoxVote.where(election: election, candidate: candidate, box: box).present?
    end
    string
  end

  def box_party_count(election, box, party_short)
    party = Party.where(short_name: party_short)
    ElectionPartyBoxVote.where(election: election, party: party, box: box).first.vote_count
  end
end
