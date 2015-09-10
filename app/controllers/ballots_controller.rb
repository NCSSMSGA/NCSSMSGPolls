class BallotsController < ApplicationController
  before_action :filter_admin, only: [:index, :edit, :update, :destroy]
  before_action :set_ballot, only: [:show, :edit, :update, :destroy]

  # GET /ballots
  # GET /ballots.json
  def index
    @ballots = Ballot.all
  end

  # GET /ballots/1
  # GET /ballots/1.json
  def show
    redirect_to root_path, notice: "You must own this resource to view it." unless @ballot.user_id == current_user.id
  end

  # GET /ballots/new
  def new
    @ballot = Election.last.ballots.build
    @ballot.election.numcand.times { @ballot.votes.build }
  end

  # GET /ballots/1/edit
  def edit
  end

  # POST /ballots
  # POST /ballots.json
  def create
    @ballot = Ballot.new(ballot_params)
    @ballot.user = current_user
    if current_user.ballots.any? and current_user.ballots.pluck(:election_id).include? ballot_params[:election_id].to_i
      redirect_to root_path, notice: "You have already voted in the #{@ballot.election.name}"
      return
    end
    unless @ballot.votes.size <= @ballot.election.numcand and @ballot.votes.size > 0
      redirect_to root_path, notice: "You may only vote for #{@ballot.election.numcand} candidates, and you should vote for at least 1."
      return
    end
    unless @ballot.election.years.include? current_user.year
      redirect_to root_path, notice: "Only members from the class of #{@ballot.election.years.map{|x| 2000+x}.to_sentence} may vote in this election."
      return
    end
    voted_ids = @ballot.votes.all.map(&:candidate_id).compact
    unless voted_ids == voted_ids.uniq
      redirect_to root_path, notice: "Please select #{@ballot.election.numcand} unique candidates"
      return
    end
    if @ballot.election.ranked
      ranks = @ballot.votes.all.map(&:rank)
      unless ranks == ranks.uniq
        redirect_to root_path, notice: "Please ensure each vote has a unique rank"
        return
      end
    end
    respond_to do |format|
      if @ballot.save
        format.html { redirect_to @ballot, notice: 'Ballot was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ballot }
      else
        format.html { render action: 'new' }
        format.json { render json: @ballot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ballots/1
  # DELETE /ballots/1.json
  def destroy
    @ballot.destroy
    respond_to do |format|
      format.html { redirect_to ballots_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ballot
      @ballot = Ballot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ballot_params
      params.require(:ballot).permit(:user_id, :election_id, votes_attributes: [:candidate_id, :rank])
    end
end
