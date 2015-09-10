class PagesController < ApplicationController
  def vote
    @elections = Election.where(active: true)
    @ballots = Array.new
    @elections.each do |e|
      @ballots[e.id] = e.ballots.build
      e.numcand.times {@ballots[e.id].votes.build}
    end
  end

  def results
    @election = Election.find(params[:id])
    @votes = @election.votes

    respond_to do |format|
      format.html {redirect_to root_path, notice: 'Please use the button.'}
      format.xls {
         filename = "Votes-#{@election.name}.xls"
         send_data(@votes.to_xls, :filename => filename)
      }
    end
  end
end
