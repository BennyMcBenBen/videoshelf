class DiscController < ApplicationController
  
  before_filter :authorize
  
  def index
    list
    render :action => 'list'
  end
  
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
  :redirect_to => { :action => :list }
  
  def list
    @disc_pages, @discs = paginate :discs, :per_page => 10
  end
  
  def show
    @disc = Disc.find(params[:id])
  end
  
  def new
    @disc = Disc.new
  end
  
  def create
    @disc = Disc.new(params[:disc])
    if @disc.save
      flash[:notice] = 'Disc was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @disc = Disc.find(params[:id])
  end
  
  def update
    @disc = Disc.find(params[:id])
    if @disc.update_attributes(params[:disc])
      flash[:notice] = 'Disc was successfully updated.'
      redirect_to :action => 'show', :id => @disc
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    Disc.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
