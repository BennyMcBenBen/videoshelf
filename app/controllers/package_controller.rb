class PackageController < ApplicationController
  layout "manager"
  
  before_filter :authorize
  
  def index
    list
    render :action => 'list'
  end
  
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
  :redirect_to => { :action => :list }
  
  def list
    @package_pages, @packages = paginate :packages, :per_page => 10
  end
  
  def show
    @package = Package.find(params[:id])
    @discs = @package.discs
  end
  
  def new
    @package = Package.new
    @discs = @package.discs.build
  end
  
  def create
    @package = Package.new(params[:package])
    if @package.save
      for i in (1..@package.no_discs)
        @disc = Disc.create(
                            :package => @package,
                            :disc_no => i)
      end
      flash[:notice] = 'Package was successfully created.'
      redirect_to :action => 'add_videos', :id => @package
    else
      render :action => 'new'
    end
  end
  
  def add_videos
    @package = Package.find(params[:id])
    @package.discs.each do |disc|
      disc.disc_videos.build
    end
    @videos = Video.select_all_videos
  end
  
  def save_videos
    @package = Package.find(params[:id])
    params[:disc].each do |disc_no, video_ids|
      logger.info "#{disc_no} => #{video_ids}"
      disc = Disc.find(:first, 
                       :conditions => ["package_id = ? AND disc_no = ?", 
      @package.id, disc_no])
      video_ids.each do |video_id|
        disc_video = DiscVideo.new(
            'disc_id' => disc.id,
            'video_id' => video_id)
        if disc_video.save
          logger.info 'Disc video was successfully created.'
        else
          logger.info 'Disc video creation failed.'
        end
      end
    end
    redirect_to :action => 'show', :id => @package.id
  end
  
  def edit
    @package = Package.find(params[:id])
  end
  
  def update
    @package = Package.find(params[:id])
    if @package.update_attributes(params[:package])
      flash[:notice] = 'Package was successfully updated.'
      redirect_to :action => 'show', :id => @package
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    Package.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
