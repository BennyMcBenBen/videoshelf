class CreateShows < ActiveRecord::Migration
  def self.up
    create_table :shows do |t|
      t.column :title, :string
      t.column :description, :text
      t.column :image_url, :string
      t.column :onair, :boolean
      t.column :no_seasons, :integer
      t.column :start_year, :integer
      t.column :end_year, :integer
    end
    
    execute "alter table videos add constraint fk_video_shows
      foreign key (show_id) references shows(id)"
  end

  def self.down
    drop_table :shows
  end
end
