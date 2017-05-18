class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string  :response, null: false
      t.references  :question, foreign_key: true
      t.references  :answerer
      t.timestamps(null: false)
    end
  end
end
