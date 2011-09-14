class CreatePackages < ActiveRecord::Migration
  def self.up
    create_table :packages do |t|
      t.column :title,        :string, :null => false
      t.column :description,  :text
      t.column :image_url,    :string
      t.column :no_discs,     :integer, :null => false, :default => 1
    end
  end

  def self.down
    drop_table :packages
  end
end
