class AddPackageFormat < ActiveRecord::Migration
  def self.up
    add_column :packages, :format, :string
  end
  
  def self.down
    remove_column :packages, :format
  end
end
