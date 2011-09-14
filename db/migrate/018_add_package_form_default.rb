class AddPackageFormDefault < ActiveRecord::Migration
  def self.up
    change_column :packages, :form, :string, :default => "film"
  end
  
  def self.down
    change_column :packages, :form, :string
  end
end
