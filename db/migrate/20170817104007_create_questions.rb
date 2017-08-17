class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string    :title
      t.string    :text
      t.integer   :author_id
      t.integer   :best_answer_id

      t.timestamps
    end
  end
end
