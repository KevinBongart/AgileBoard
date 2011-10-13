class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.text :description
      t.integer :position
      t.boolean :complete
      t.integer :story_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
