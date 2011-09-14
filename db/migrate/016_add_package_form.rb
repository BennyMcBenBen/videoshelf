class AddPackageForm < ActiveRecord::Migration
  def self.up
    add_column :packages, :form, :string
  end

  def self.down
    remove_column :packages, :form
  end
end
