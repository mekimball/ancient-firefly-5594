require 'rails_helper'

RSpec.describe 'Competition Show Page', type: :feature do
  before do
    @competition_1 = Competition.create!(name: "Stanley Cup Finals", location: "Dallas", sport: "Hockey")

    @team_1 = Team.create!(nickname: "Lightning", hometown: "Tampa")
    @team_2 = Team.create!(nickname: "Avalanche", hometown: "Denver")

    @player_1 = @team_1.players.create!(name: "Jim", age: 37)
    @player_2 = @team_1.players.create!(name: "Tim", age: 27)
    @player_3 = @team_1.players.create!(name: "Kim", age: 17)

    @player_4 = @team_2.players.create!(name: "Bob", age: 18)
    @player_5 = @team_2.players.create!(name: "Rob", age: 24)
    @player_6 = @team_2.players.create!(name: "Lob", age: 20)

    CompetitionTeams.create!(competition: @competition_1, team: @team_1)
    CompetitionTeams.create!(competition: @competition_1, team: @team_2)

    visit competition_path(@competition_1)
  end

  describe 'Competitions Show' do
    it 'shows the competitions info' do
      expect(page).to have_content(@competition_1.name)
      expect(page).to have_content(@competition_1.location)
      expect(page).to have_content(@competition_1.sport)
    end
  end
end
# As a user
# When I visit a competition's show page
# Then I see the competition's name, location, and sport
# And I see the name and hometown of all teams in this competition
# And I see the average age of all players in the competition