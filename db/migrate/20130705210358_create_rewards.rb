class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.belongs_to :game, index: true
      t.integer    :score
      t.integer    :position

      t.timestamps
    end
  end
end
