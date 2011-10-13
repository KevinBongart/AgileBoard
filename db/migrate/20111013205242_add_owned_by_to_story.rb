class AddOwnedByToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :owned_by, :string
  end

  def self.down
    remove_column :stories, :owned_by
  end
end
