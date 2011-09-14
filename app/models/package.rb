class Package < ActiveRecord::Base
  has_many :discs, :dependent => :destroy
  has_many :package_libraries, :dependent => :destroy
  
  validates_presence_of :title, :no_discs
  validates_format_of  :image_url,
  :with => %r{\.(gif|jpg|png)$}i,
  :message => "must be a URL for a GIF, JPG, or PNG image"
  
  def pretty_format
    pretty = format
    if format == 'dvd'
      pretty = 'DVD'
    elsif format == 'blu-ray'
      pretty = 'Blu-ray'
    end
    pretty
  end
  
  def self.create_simple_dvd(video)
    package = create(
      :title => video.title,
      :description => video.description,
      :image_url => video.image_url,
      :no_discs => 1,
      :form => 'film',
      :format => 'dvd')
    disc = Disc.create(
      :package => package,
      :disc_no => 1)
    DiscVideo.create(
      :disc => disc,
      :video => video)
    package
  end
end
