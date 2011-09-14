class DiscVideo < ActiveRecord::Base
  belongs_to :video
  belongs_to :disc
  
  validates_presence_of     :video_id, :disc_id
end
