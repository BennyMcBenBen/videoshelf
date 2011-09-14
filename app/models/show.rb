class Show < ActiveRecord::Base
  has_many :episodes, :dependent => :destroy
  
  validates_presence_of :title, :description
  validates_numericality_of :no_seasons, :start_year, :end_year
  validates_format_of  :image_url,
                      :with => %r{\.(gif|jpg|png)$}i,
                      :message => "must be a URL for a GIF, JPG, or PNG image"
end
