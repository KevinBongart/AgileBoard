class AddPivotalIdToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :pivotal_id, :integer
  end

  def self.down
    remove_column :stories, :pivotal_id
  end
end
