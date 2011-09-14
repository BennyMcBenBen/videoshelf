class AddTestData < ActiveRecord::Migration
  def self.up
    # start from scratch
    Video.delete_all
    Show.delete_all
  end

  def self.down
    Video.delete_all
    Show.delete_all
  end
end
