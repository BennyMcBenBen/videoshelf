class VideoLibraryController < ApplicationController
  layout "main"
  
  before_filter :authorize
  
  def index
    redirect_to :controller => 'main', :action => 'list'
  end
  
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
  :redirect_to => { :controller => 'main', :action => 'library' }
  
  def list
    @library_pages, @videos = paginate :videos, :per_page => 10
  end
  
  def show
    @video_library = Video.find(params[:id])
  end
  
  def new
    @video_library = VideoLibrary.new
  end
  
  def create
    @video_library = VideoLibrary.new(params[:video_library])
    if @video_library.save
      flash[:notice] = 'Library item was successfully created.'
      redirect_to :controller => 'main', :action => 'library'
    else
      flash[:notice] = 'Library item creation failed.'
      redirect_to :controller => 'main', :action => 'library'
    end
  end
  
  def destroy
    VideoLibrary.find(params[:id]).destroy
    redirect_to :controller => 'main', :action => 'library'
  end
end
