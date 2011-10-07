class AddAcceptedAtToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :accepted_at, :datetime
  end

  def self.down
    remove_column :stories, :accepted_at
  end
end
