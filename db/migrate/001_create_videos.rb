class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.column :type,         :string
      
      # common attributes
      t.column :title,        :string
      t.column :description,  :text
      t.column :image_url,    :string
      t.column :year,         :integer
      
      # attributes for type="Episode"
      t.column :show_id,      :integer
      t.column :season_ep_no, :integer
      t.column :season_no,    :integer
    end
  end

  def self.down
    drop_table :videos
  end
end
