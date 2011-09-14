class CreateDiscVideos < ActiveRecord::Migration
  def self.up
    create_table :disc_videos do |t|
      t.column :disc_id,      :integer, :null => false
      t.column :video_id,     :integer, :null => false
    end
    
    execute "alter table disc_videos add constraint fk_disc_video_disc
      foreign key (disc_id) references discs(id)"
    
    execute "alter table disc_videos add constraint fk_disc_video_video
      foreign key (video_id) references videos(id)"
  end
  
  def self.down
    drop_table :disc_videos
  end
end
