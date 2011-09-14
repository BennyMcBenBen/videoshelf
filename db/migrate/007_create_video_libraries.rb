class CreateVideoLibraries < ActiveRecord::Migration
  def self.up
    create_table :video_libraries do |t|
      t.column :video_id, :integer, :null => false
      t.column :user_id, :integer, :null => false
    end
    
    execute "alter table video_libraries add constraint fk_video_libraries_video
      foreign key (video_id) references videos(id)"
      
    execute "alter table video_libraries add constraint fk_video_libraries_user
      foreign key (user_id) references users(id)"
  end

  def self.down
    drop_table :video_libraries
  end
end
