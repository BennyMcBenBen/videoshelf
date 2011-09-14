class CreateDiscs < ActiveRecord::Migration
  def self.up
    create_table :discs do |t|
      t.column :package_id,   :integer, :null => false
      t.column :disc_no,      :integer, :null => false
      t.column :description,  :text
    end
    
    execute "alter table discs add constraint fk_disc_package
      foreign key (package_id) references packages(id)"
  end
  
  def self.down
    drop_table :discs
  end
end
