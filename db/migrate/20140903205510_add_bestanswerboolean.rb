class AddBestanswerboolean < ActiveRecord::Migration
  def change
    add_column :answers, :bestanswer, :boolean, default: false
  end
end
