class Admin::ElectionsController < AdminController
  before_action :authenticate_user!
  before_action :set_election, only: [:show, :edit, :update, :destroy, :box_votes]
  before_action :set_vote_election, only: [:add_votes, :save_votes, :delete_votes]

  def add_votes
    @boxes = Box.all.map{ |box| ["#{box.no} - #{box.name}", box.id]}
    @parties = @election.parties
    @candidates = @election.candidates
  end

  def save_votes
    box = Box.find(params[:votes][:box_id])
    if( @election.election_type.option == 'party')
      params[:votes].to_unsafe_h.each do |vote|
        if(vote.first.starts_with?('party'))
          party = Party.find(vote.first.split('_').last)
          vote = ElectionPartyBoxVote.new({election_id: @election.id, party: party, box: box, vote_count: vote.last})
          vote.save!
        end
      end
    elsif ( @election.election_type.option == 'candidate')
      params[:votes].to_unsafe_h.each do |vote|
        if(vote.first.starts_with?('candidate'))
          candidate = Candidate.find(vote.first.split('_').last)
          vote = ElectionCandidateBoxVote.new({election: @election, candidate: candidate, box: box, vote_count: vote.last})
          vote.save!
        end
      end
    end
    redirect_to admin_election_path(@election)
  end

  def delete_votes
    box = Box.find(params[:format])
    if( @election.election_type.option == 'party')
      ElectionPartyBoxVote.where(election: @election, box: box).each(&:destroy)
    elsif ( @election.election_type.option == 'candidate')
      ElectionCandidateBoxVote.where(election: @election, box: box).each(&:destroy)
    end
    redirect_to admin_election_path(@election)
  end

  def index
    @elections = Election.all
  end

  def show
    @boxes = Box.all
  end

  def new
    @election = Election.new
  end

  def edit
  end

  def create
    @election = Election.new(election_params)

    respond_to do |format|
      if @election.save
        format.html { redirect_to admin_elections_url, notice: 'Election was successfully created.' }
      else
        format.html { render :new }
      end
    end
    Rails.cache.clear
  end

  def update
    respond_to do |format|
      if @election.update(election_params)
        format.html { redirect_to admin_elections_url, notice: 'Election was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
    Rails.cache.clear
  end

  def destroy
    @election.destroy
    respond_to do |format|
      format.html { redirect_to admin_elections_url, notice: 'Election was successfully destroyed.' }
    end
    Rails.cache.clear
  end

  private


    def set_election
      @election = Election.find(params[:id])
    end

    def set_vote_election
      @election = Election.find(params[:election_id])
    end

    def election_params
      params.require(:election).permit(:name, :year, :active, :publishable, :election_type_id, :box_id)
    end
end
