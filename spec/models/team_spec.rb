require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many :competition_teams }
    it { should have_many(:competitions).through(:competition_teams) }
  end

  describe 'methods' do
    it '#average_age' do
      team_1 = Team.create!(nickname: 'Lightning', hometown: 'Tampa Bay')

      player_1 = team_1.players.create!(name: 'Jim', age: 10)
      player_2 = team_1.players.create!(name: 'Tim', age: 20)

      expect(team_1.average_age).to eq(15)
    end

    it 'orders team by players average age' do
    team_1 = Team.create!(nickname: 'Lightning', hometown: 'Tampa Bay')
    team_2 = Team.create!(nickname: 'Avalanche', hometown: 'Denver')
    team_3 = Team.create!(nickname: 'Panthers', hometown: 'Florida')

    player_1 = team_1.players.create!(name: 'Jim', age: 37)
    player_2 = team_1.players.create!(name: 'Tim', age: 27)
    player_3 = team_1.players.create!(name: 'Kim', age: 17)

    player_4 = team_2.players.create!(name: 'Bob', age: 18)
    player_5 = team_2.players.create!(name: 'Rob', age: 24)
    player_6 = team_2.players.create!(name: 'Lob', age: 20)

    player_7 = team_3.players.create!(name: 'Tony', age: 21)
    player_8 = team_3.players.create!(name: 'Toni', age: 22)
    player_9 = team_3.players.create!(name: 'Tone', age: 23)

    expect(Team.order_age).to eq([team_1, team_3, team_2])
    end
  end
end
