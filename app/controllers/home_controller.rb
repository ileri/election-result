class HomeController < ApplicationController
  def index
    @elections = Election.where(active: true)
    unless(@elections.empty?)
      @vote_counts = []
      @elections.map{ |election| @vote_counts << election_vote_counts(election)}
    end
  end

  private
  def election_vote_counts(election)
    votes = []
    if(election.election_type.option == 'party')
      election.parties.each do |party|
        votes << [party.name, ElectionPartyBoxVote.where(election: election, party: party).map(&:vote_count).inject(0, :+)]
      end
    elsif(election.election_type.option == 'candidate')
      election.candidates.each do |candidate|
        votes << [candidate.name, ElectionCandidateBoxVote.where(election: election, candidate: candidate).map(&:vote_count).inject(0, :+)]
      end
    end
    votes
  end

  def election_box_votes(election, box)
    votes = []
    if(election.election_type.option == 'party')
      election.parties.each do |party|
        box_result = ElectionPartyBoxVote.where(election: election, party: party, box: box)
        votes << []
      end
    elsif(election.election_type.option == 'candidate')
      election.candidates.each do |candidate|
        votes << [candidate.name, ElectionCandidateBoxVote.where(election: election, candidate: candidate, box: box).map(&:vote_count).inject(0, :+)]
      end
    end
    votes
  end

end
