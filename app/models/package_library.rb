class PackageLibrary < ActiveRecord::Base
  belongs_to :package
  belongs_to :user
  
  validates_presence_of     :package_id, :user_id
end
