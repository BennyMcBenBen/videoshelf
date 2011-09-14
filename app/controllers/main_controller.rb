class MainController < ApplicationController
  
  before_filter :authorize
  
  def index
    @videos = Video.find_new_videos
  end
  
  def video
    @video = Video.find(params[:id])
    @video_library = VideoLibrary.new
    @library_item = VideoLibrary.find(:first, 
                                      :conditions => ["user_id = ? AND video_id = ?", @app_user.id, @video.id])
    @wishlist_item = Wishlist.find(:first, 
                                   :conditions => ["user_id = ? AND video_id = ?", @app_user.id, @video.id])
    @prev_ep
    @next_ep
    if @video.class == Episode
      @prev_ep = Video.find(:all, 
                            :conditions => ["show_id = ? and ((season_no = ? and season_ep_no < ?) 
          or (season_no < ?))", @video.show_id, @video.season_no, @video.season_ep_no, 
      @video.season_no], 
      :order => "season_no DESC, season_ep_no DESC", 
      :limit => 1).first
      @next_ep = Video.find(:all, 
                            :conditions => ["show_id = ? and ((season_no = ? and season_ep_no > ?) 
          or (season_no > ?))", @video.show_id, @video.season_no, @video.season_ep_no, 
      @video.season_no], 
      :order => "season_no, season_ep_no", 
      :limit => 1).first
    end
    
    @packages = Array.new
    @video.disc_videos.each do |disc_video|
      @packages << disc_video.disc.package
    end
    
    @online_video = OnlineVideo.find(:first, :conditions => ["video_id = ?", @video.id])
  end
  
  def show
    @show = Show.find(params[:id])
    @episodes = Episode.find_show_episodes(@show.id)
  end
  
  def package
    @package = Package.find(params[:id])
    if @package.form == 'show'
      @order_by = 'videos.season_no, videos.season_ep_no'
    else
      @order_by = 'videos.title'
    end
    @library_item = PackageLibrary.find(:first, 
                                        :conditions => ["user_id = ? AND package_id = ?", @app_user.id, @package.id])
  end
  
  def browse
    @videos = Video.find_all_films
    @episodes = Episode.find_all_episodes
    @shows = Show.find(:all, :order => 'title')
    @packages = Package.find(:all, :order => :title)
  end
  
  def search
    
  end
  
  def library
    @video_library = VideoLibrary.find_ordered_list(@app_user.id)
    @package_library = PackageLibrary.find(:all, 
      :include => :package, 
      :conditions => ["user_id = ?", @app_user.id], 
      :order => 'packages.title')
  end
  
  def ratings
    
  end
  
  def wishlist
    @wishlist = Wishlist.find_ordered_list(@app_user.id)
  end
  
  def friends
    
  end
  
  def add_to_video_library
    @video_library = VideoLibrary.new(
      'video_id' => params[:video_id],
      'user_id' => params[:user_id])
    if @video_library.save
      flash[:notice] = 'Library item was successfully created.'
    else
      flash[:notice] = 'Library item creation failed.'
    end
    redirect_to :action => 'video', :id => params[:video_id]
  end
  
  def delete_from_video_library
    library_item = VideoLibrary.find(params[:id])
    if library_item
      library_item.destroy
      flash[:notice] = 'Library item deleted.'
    else
      flash[:notice] = 'Library item was not deleted.'
    end
    redirect_to :action => 'library'
  end
  
  def add_to_package_library
    @package_library = PackageLibrary.new(
      'package_id' => params[:package_id],
      'user_id' => params[:user_id])
    if @package_library.save
      flash[:notice] = 'Library item was successfully created.'
    else
      flash[:notice] = 'Library item creation failed.'
    end
    redirect_to :action => 'package', :id => params[:package_id]
  end
  
  def delete_from_package_library
    library_item = PackageLibrary.find(params[:id])
    if library_item
      library_item.destroy
      flash[:notice] = 'Library item deleted.'
    else
      flash[:notice] = 'Library item was not deleted.'
    end
    redirect_to :action => 'library'
  end
  
  def add_to_wishlist
    @wishlist = Wishlist.new(
      'video_id' => params[:video_id],
      'user_id' => params[:user_id])
    if @wishlist.save
      flash[:notice] = 'Wishlist item was successfully created.'
    else
      flash[:notice] = 'Wishlist item creation failed.'
    end
    redirect_to :action => 'video', :id => params[:video_id]
  end
  
  def delete_from_wishlist
    wishlist_item = Wishlist.find(params[:id])
    if wishlist_item
      wishlist_item.destroy
      flash[:notice] = 'Wishlist item deleted.'
    else
      flash[:notice] = 'Wishlist item was not deleted.'
    end
    redirect_to :action => 'wishlist'
  end
end
