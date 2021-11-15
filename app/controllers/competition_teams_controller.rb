class CompetitionTeamsController < ApplicationController

  def create
    team = Team.where(nickname: params[:team])
    competition = Competition.where(id: params[:competition_id]).first
    CompetitionTeam.create!(competition_id: params[:competition_id], team_id: team.first.id)
    redirect_to competition_path(competition)
  end
end