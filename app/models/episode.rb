class Episode < Video
  belongs_to :show
  validates_presence_of :show, :season_ep_no, :season_no
  validates_numericality_of :season_ep_no, :season_no
  
  def self.find_all_episodes
    find(:all,
         :include => :show,
         :order => 'shows.title, season_no, season_ep_no')
  end
  
  def self.find_show_episodes(show_id)
    find(:all, :conditions => ["show_id = ?", show_id], :order => "season_no, season_ep_no")
  end
end