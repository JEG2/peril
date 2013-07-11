class AddViewedAtToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :viewed_at, :datetime
  end
end
