class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string     :type
      t.belongs_to :game,   index: true
      t.belongs_to :answer, index: true
      t.belongs_to :player, index: true

      t.timestamps
    end
  end
end
