class AddVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :answer
    end
  end
  drop_table :bestanswers
end
