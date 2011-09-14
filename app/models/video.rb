class Video < ActiveRecord::Base
  has_many :video_libraries, :dependent => :destroy
  has_many :wishlists, :dependent => :destroy
  has_many :disc_videos, :dependent => :destroy
  has_many :online_videos, :dependent => :destroy
  
  validates_presence_of :title, :year, :length
  validates_numericality_of :year, :length
  validates_format_of  :image_url,
    :with => %r{\.(gif|jpg|png)$}i,
    :message => "must be a URL for a GIF, JPG, or PNG image"
  
  def self.find_all_films
    find(:all, :conditions => 'type is NULL', :order => 'title')
  end
  
  def self.find_new_videos
    find(:all, :order => "id DESC", :limit => 5)
  end
  
  def pretty_title
    @pretty_title = ''
    if self.class == Episode
      @pretty_title = self.show.title + ': '
    end
    return @pretty_title += self.title
  end
  
  def self.select_all_videos
    find_by_sql("select concat(if(shows.title is null, '', " + 
      "concat(shows.title,' ',videos.season_no,'x',videos.season_ep_no,': ')),videos.title) title, videos.id from videos left" + 
      " join shows on videos.show_id = shows.id order by concat(if(shows.title is null, '', concat(shows.title,' ',lpad(videos.season_no,3,0),'x',lpad(videos.season_ep_no,3,0),': ')),videos.title)")
  end
end
