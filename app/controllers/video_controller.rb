class VideoController < ApplicationController
  
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
    @video_pages, @videos = paginate :videos, :per_page => 10
  end
  
  def show
    @video = Video.find(params[:id])
  end
  
  def new
    @video = Video.new
    @shows = Show.find(:all, :order => 'title')
  end
  
  def create
    @shows = Show.find(:all, :order => 'title')
    if params[:video][:type] == 'Episode'
      @episode = Episode.new(params[:video])
      if @episode.save
        @redo_episode = false
        flash[:notice] = 'Episode was successfully created.'
        redirect_to :action => 'list'
      else
        @redo_episode = true
        @video = Video.new(params[:video])
        render :action => 'new'
      end
    else
      @redo_episode = false
      @video = Video.new(params[:video])
      if @video.save
        flash[:notice] = 'Video was successfully created.'
        redirect_to :action => 'list'
      else
        render :action => 'new'
      end
    end
  end
  
  def edit
    @video = Video.find(params[:id])
    @shows = Show.find(:all, :order => 'title')
  end
  
  def update
    if params[:video][:type] == 'Episode'
      @episode = Episode.find(params[:id])
      if @episode.update_attributes(params[:video])
        flash[:notice] = 'Episode was successfully updated.'
        redirect_to :action => 'show', :id => @episode
      else
        @video = Video.find(params[:id])
        render :action => 'edit'
      end     
    else
      @video = Video.find(params[:id])
      if @video.update_attributes(params[:video])
        flash[:notice] = 'Video was successfully updated.'
        redirect_to :action => 'show', :id => @video
      else
        render :action => 'edit'
      end
    end
  end
  
  def destroy
    Video.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
