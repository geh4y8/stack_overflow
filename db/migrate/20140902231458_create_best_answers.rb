class CreateBestAnswers < ActiveRecord::Migration
  def change
    create_table :best_answers do |t|
      t.belongs_to :question
      t.belongs_to :answer
    end
  end
end
