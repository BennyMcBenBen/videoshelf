class OnlineVideoController < ApplicationController
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
    @online_video_pages, @online_videos = paginate :online_videos, :per_page => 10
  end

  def show
    @online_video = OnlineVideo.find(params[:id])
  end

  def new
    @online_video = OnlineVideo.new
    @videos = Video.select_all_videos
  end

  def create
    @online_video = OnlineVideo.new(params[:online_video])
    if @online_video.save
      flash[:notice] = 'OnlineVideo was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @online_video = OnlineVideo.find(params[:id])
    @videos = Video.select_all_videos
  end

  def update
    @online_video = OnlineVideo.find(params[:id])
    if @online_video.update_attributes(params[:online_video])
      flash[:notice] = 'OnlineVideo was successfully updated.'
      redirect_to :action => 'show', :id => @online_video
    else
      render :action => 'edit'
    end
  end

  def destroy
    OnlineVideo.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
