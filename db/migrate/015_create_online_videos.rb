class CreateOnlineVideos < ActiveRecord::Migration
  def self.up
    create_table :online_videos do |t|
      t.column :video_id, :integer, :null => false
      t.column :embed, :text, :null => false
    end
    
    execute "alter table online_videos add constraint fk_online_videos_video
      foreign key (video_id) references videos(id)"
  end
  
  def self.down
    drop_table :online_videos
  end
end
