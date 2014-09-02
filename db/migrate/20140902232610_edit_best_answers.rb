class EditBestAnswers < ActiveRecord::Migration
  def change
    create_table :bestanswers do |t|
      t.belongs_to :question
      t.belongs_to :answer
    end
  end
  drop_table :best_answers
end
