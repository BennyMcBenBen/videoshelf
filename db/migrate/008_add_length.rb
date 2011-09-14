class AddLength < ActiveRecord::Migration
  def self.up
    add_column :videos, :length, :integer, :null => false
  end

  def self.down
    remove_column :videos, :length
  end
end
