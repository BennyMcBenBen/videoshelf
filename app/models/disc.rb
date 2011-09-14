class Disc < ActiveRecord::Base
  belongs_to :package
  has_many :disc_videos, :dependent => :destroy
end
