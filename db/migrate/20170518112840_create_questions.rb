class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string  :title, null: false
      t.string  :body
      t.references  :questioner
      t.timestamps(null: false)
    end
  end
end
