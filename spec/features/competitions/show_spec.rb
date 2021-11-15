require 'rails_helper'

RSpec.describe 'Competition Show Page', type: :feature do
  before do
    @competition_1 = Competition.create!(name: "Stanley Cup Finals", location: "Dallas", sport: "Hockey")

    @team_1 = Team.create!(nickname: "Lightning", hometown: "Tampa Bay")
    @team_2 = Team.create!(nickname: "Avalanche", hometown: "Denver")
    @team_3 = Team.create!(nickname: "Panthers", hometown: "Florida")

    @player_1 = @team_1.players.create!(name: "Jim", age: 37)
    @player_2 = @team_1.players.create!(name: "Tim", age: 27)
    @player_3 = @team_1.players.create!(name: "Kim", age: 17)

    @player_4 = @team_2.players.create!(name: "Bob", age: 18)
    @player_5 = @team_2.players.create!(name: "Rob", age: 24)
    @player_6 = @team_2.players.create!(name: "Lob", age: 20)

    CompetitionTeam.create!(competition: @competition_1, team: @team_1)
    CompetitionTeam.create!(competition: @competition_1, team: @team_2)

    visit competition_path(@competition_1)
  end

  describe 'Competitions Show' do
    it 'shows the competitions info' do
      expect(page).to have_content(@competition_1.name)
      expect(page).to have_content(@competition_1.location)
      expect(page).to have_content(@competition_1.sport)
    end

    it 'shows name and hometown of all teams' do
      expect(page).to have_content(@team_1.nickname)
      expect(page).to have_content(@team_1.hometown)
      expect(page).to have_content(@team_2.nickname)
      expect(page).to have_content(@team_2.hometown)
      expect(page).to_not have_content(@team_3.nickname)
      expect(page).to_not have_content(@team_3.hometown)
    end

    it 'shows teams average age' do
      expect(page).to have_content("#{@team_1.nickname}'s Average Age: #{@team_1.average_age}")
      expect(page).to have_content("#{@team_2.nickname}'s Average Age: #{@team_2.average_age}")
    end
  end
end
# As a user
# When I visit a competition's show page
# Then I see the competition's name, location, and sport
# And I see the name and hometown of all teams in this competition
# And I see the average age of all players in the competition