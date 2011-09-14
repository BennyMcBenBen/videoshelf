class ShowController < ApplicationController
  
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
    @show_pages, @shows = paginate :shows, :per_page => 10
  end
  
  def show
    @show = Show.find(params[:id])
  end
  
  def new
    @show = Show.new
  end
  
  def create
    @show = Show.new(params[:show])
    if @show.save
      flash[:notice] = 'Show was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @show = Show.find(params[:id])
  end
  
  def update
    @show = Show.find(params[:id])
    if @show.update_attributes(params[:show])
      flash[:notice] = 'Show was successfully updated.'
      redirect_to :action => 'show', :id => @show
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    Show.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
