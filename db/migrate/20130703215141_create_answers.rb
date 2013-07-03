class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :category, index: true
      t.text       :body
      t.text       :question
      t.integer    :position

      t.timestamps
    end
  end
end
