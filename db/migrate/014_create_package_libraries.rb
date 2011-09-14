class CreatePackageLibraries < ActiveRecord::Migration
  def self.up
    create_table :package_libraries do |t|
      t.column :package_id, :integer, :null => false
      t.column :user_id, :integer, :null => false
    end
    
    execute "alter table package_libraries add constraint fk_package_libraries_package
      foreign key (package_id) references packages(id)"
    
    execute "alter table package_libraries add constraint fk_package_libraries_user
      foreign key (user_id) references users(id)"
    
  end
  
  def self.down
    drop_table :package_libraries
  end
end
