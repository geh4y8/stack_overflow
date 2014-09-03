class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  scope :best_answer, ->{ where(bestanswer: true)}
end
