class AddUserIdToBoard < ActiveRecord::Migration
  def self.up
    add_column :boards, :user_id, :integer
  end

  def self.down
    remove_column :boards, :user_id
  end
end
