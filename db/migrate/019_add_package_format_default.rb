class AddPackageFormatDefault < ActiveRecord::Migration
  def self.up
    change_column :packages, :format, :string, :default => "dvd"
  end
  
  def self.down
    change_column :packages, :format, :string
  end
end
