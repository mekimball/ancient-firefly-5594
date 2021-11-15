class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :hometown
      t.string :nickname
      t.string :sport

      t.timestamps
    end
  end
end
