class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.belongs_to :game, index: true
      t.string     :name
      t.integer    :score, default: 0, null: false
      t.integer    :position

      t.timestamps
    end
  end
end
