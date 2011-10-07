class AddBoardIdToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :board_id, :integer
  end

  def self.down
    remove_column :projects, :board_id
  end
end
