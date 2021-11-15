class Team < ApplicationRecord
  has_many :players
  has_many :competition_teams
  has_many :competitions, through: :competition_teams

  def average_age
    players.average(:age).round(2)
  end

  def self.order_age
    test = Team.joins(:players)
    .select('teams.*, avg("age") AS average_age')
    .group(:id)
    .order(average_age: :desc)
  end
end
