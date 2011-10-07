class AddPointsToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :points, :integer
  end

  def self.down
    remove_column :stories, :points
  end
end
