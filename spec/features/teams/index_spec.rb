require 'rails_helper'

RSpec.describe 'Team Index', type: :feature do
  before do
    @team_1 = Team.create!(nickname: "Lightning", hometown: "Tampa Bay")
    @team_2 = Team.create!(nickname: "Avalanche", hometown: "Denver")
    @team_3 = Team.create!(nickname: "Panthers", hometown: "Florida")

    @player_1 = @team_1.players.create!(name: "Jim", age: 37)
    @player_2 = @team_1.players.create!(name: "Tim", age: 27)
    @player_3 = @team_1.players.create!(name: "Kim", age: 17)

    @player_4 = @team_2.players.create!(name: "Bob", age: 18)
    @player_5 = @team_2.players.create!(name: "Rob", age: 24)
    @player_6 = @team_2.players.create!(name: "Lob", age: 20)

    @player_7 = @team_3.players.create!(name: "Tony", age: 21)
    @player_8 = @team_3.players.create!(name: "Toni", age: 22)
    @player_9 = @team_3.players.create!(name: "Tone", age: 23)

    visit teams_path
  end

  describe 'Show page' do
    it 'shows a team name and hometown' do
      within("#id-#{@team_1.id}") do
        expect(page).to have_content(@team_1.nickname)
        expect(page).to have_content(@team_1.hometown)
      end
      within("#id-#{@team_2.id}") do
        expect(page).to have_content(@team_2.nickname)
        expect(page).to have_content(@team_2.hometown)
      end
    end

    it 'shows teams players' do
      
      within("#id-#{@team_1.id}") do
        expect(page).to have_content(@player_1.name)
        expect(page).to have_content(@player_1.age)
        expect(page).to have_content(@player_2.name)
        expect(page).to have_content(@player_2.age)
        expect(page).to have_content(@player_3.name)
        expect(page).to have_content(@player_3.age)
        expect(page).to_not have_content(@player_4.name)
      end

      within("#id-#{@team_2.id}") do
        expect(page).to have_content(@player_4.name)
        expect(page).to have_content(@player_4.age)
        expect(page).to have_content(@player_5.name)
        expect(page).to have_content(@player_5.age)
        expect(page).to have_content(@player_6.name)
        expect(page).to have_content(@player_6.age)
        expect(page).to_not have_content(@player_1.name)
      end
    end
    describe 'sort' do
      it 'sorts by average team age' do

        expect(@team_1.nickname).to appear_before(@team_3.nickname)
        expect(@team_3.nickname).to appear_before(@team_2.nickname)
      end
    end
  end
end
