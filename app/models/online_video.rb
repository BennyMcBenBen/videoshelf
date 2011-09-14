class OnlineVideo < ActiveRecord::Base
  belongs_to :video
  
  validates_presence_of     :video_id, :embed
end
