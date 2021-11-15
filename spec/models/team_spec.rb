require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many :competition_teams}
    it {should have_many(:competitions).through(:competition_teams)}
  end

  describe 'methods' do
    it '#average_age' do
    team_1 = Team.create!(nickname: "Lightning", hometown: "Tampa Bay")

    player_1 = team_1.players.create!(name: "Jim", age: 10)
    player_2 = team_1.players.create!(name: "Tim", age: 20)

    expect(team_1.average_age).to eq(15)
    end
  end
end
