class Wishlist < ActiveRecord::Base
  belongs_to :video
  belongs_to :user
  
  validates_presence_of     :video_id, :user_id
  
  def self.find_ordered_list(user_id)
    find_by_sql(["select wishlists.id item_id, shows.id show_id, shows.title show_title, videos.id video_id, videos.title video_title, videos.season_no, videos.season_ep_no " + 
    "from wishlists join videos on wishlists.video_id = videos.id " +
    "left join shows on shows.id = videos.show_id " +
    "where wishlists.user_id = ? " +
    "order by concat(if(videos.show_id is null, '', concat(shows.title, lpad(videos.season_no,3,0), lpad(videos.season_ep_no,3,0))),videos.title)", user_id])
  end
end
