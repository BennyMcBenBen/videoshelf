class CreateWishlists < ActiveRecord::Migration
  def self.up
    create_table :wishlists do |t|
      t.column :video_id, :integer, :null => false
      t.column :user_id, :integer, :null => false
    end
    
    execute "alter table wishlists add constraint fk_wishlists_video
      foreign key (video_id) references videos(id)"
      
    execute "alter table wishlists add constraint fk_wishlists_user
      foreign key (user_id) references users(id)"
  end
  
  def self.down
    drop_table :wishlists
  end
end
