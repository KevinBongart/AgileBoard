class CreateLabelsStories < ActiveRecord::Migration
  def self.up
    create_table :labels_stories, :id => false do |t|
      t.integer :label_id
      t.integer :story_id
    end
  end

  def self.down
    drop_table :labels_stories
  end
end
