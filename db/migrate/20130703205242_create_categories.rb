class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.belongs_to :game, index: true
      t.string     :name
      t.string     :slug
      t.integer    :position

      t.timestamps
    end
  end
end
