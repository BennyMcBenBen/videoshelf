class DiscVideoController < ApplicationController
  before_filter :authorize
  
  def index
    list
    render :action => 'list'
  end
  
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
  :redirect_to => { :action => :list }
  
  def list
    @disc_video_pages, @disc_videos = paginate :disc_videos, :per_page => 10
  end
  
  def show
    @disc_video = DiscVideo.find(params[:id])
  end
  
  def new
    @disc_video = DiscVideo.new
  end
  
  def create
    @disc_video = DiscVideo.new(params[:disc_video])
    if @disc_video.save
      flash[:notice] = 'DiscVideo was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @disc_video = DiscVideo.find(params[:id])
  end
  
  def update
    @disc_video = DiscVideo.find(params[:id])
    if @disc_video.update_attributes(params[:disc_video])
      flash[:notice] = 'DiscVideo was successfully updated.'
      redirect_to :action => 'show', :id => @disc_video
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    DiscVideo.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
