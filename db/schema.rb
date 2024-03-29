# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 20) do

  create_table "disc_videos", :force => true do |t|
    t.column "disc_id",  :integer, :null => false
    t.column "video_id", :integer, :null => false
  end

  add_index "disc_videos", ["disc_id"], :name => "fk_disc_video_disc"
  add_index "disc_videos", ["video_id"], :name => "fk_disc_video_video"

  create_table "discs", :force => true do |t|
    t.column "package_id",  :integer, :null => false
    t.column "disc_no",     :integer, :null => false
    t.column "description", :text
  end

  add_index "discs", ["package_id"], :name => "fk_disc_package"

  create_table "online_videos", :force => true do |t|
    t.column "video_id", :integer,                 :null => false
    t.column "embed",    :text,    :default => "", :null => false
  end

  add_index "online_videos", ["video_id"], :name => "fk_online_videos_video"

  create_table "package_libraries", :force => true do |t|
    t.column "package_id", :integer, :null => false
    t.column "user_id",    :integer, :null => false
  end

  add_index "package_libraries", ["package_id"], :name => "fk_package_libraries_package"
  add_index "package_libraries", ["user_id"], :name => "fk_package_libraries_user"

  create_table "packages", :force => true do |t|
    t.column "title",       :string,  :default => "",     :null => false
    t.column "description", :text
    t.column "image_url",   :string
    t.column "no_discs",    :integer, :default => 1,      :null => false
    t.column "form",        :string,  :default => "film"
    t.column "format",      :string,  :default => "dvd"
  end

  create_table "sessions", :force => true do |t|
    t.column "session_id", :string
    t.column "data",       :text
    t.column "updated_at", :datetime
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shows", :force => true do |t|
    t.column "title",       :string
    t.column "description", :text
    t.column "image_url",   :string
    t.column "onair",       :boolean
    t.column "no_seasons",  :integer
    t.column "start_year",  :integer
    t.column "end_year",    :integer
  end

  create_table "users", :force => true do |t|
    t.column "name",            :string
    t.column "hashed_password", :string
    t.column "salt",            :string
    t.column "level",           :string
  end

  create_table "video_libraries", :force => true do |t|
    t.column "video_id", :integer, :null => false
    t.column "user_id",  :integer, :null => false
  end

  add_index "video_libraries", ["video_id"], :name => "fk_video_libraries_video"
  add_index "video_libraries", ["user_id"], :name => "fk_video_libraries_user"

  create_table "videos", :force => true do |t|
    t.column "type",         :string
    t.column "title",        :string
    t.column "description",  :text
    t.column "image_url",    :string
    t.column "year",         :integer
    t.column "show_id",      :integer
    t.column "season_ep_no", :integer
    t.column "season_no",    :integer
    t.column "length",       :integer, :null => false
  end

  add_index "videos", ["show_id"], :name => "fk_video_shows"

  create_table "wishlists", :force => true do |t|
    t.column "video_id", :integer, :null => false
    t.column "user_id",  :integer, :null => false
  end

  add_index "wishlists", ["video_id"], :name => "fk_wishlists_video"
  add_index "wishlists", ["user_id"], :name => "fk_wishlists_user"

end
