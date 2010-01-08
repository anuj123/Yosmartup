class AddFbUserId < ActiveRecord::Migration
  def self.up
      add_column :blogs, :fb_user_id, :integer
  end

  def self.down
      remove_column :blogs, :fb_user_id
  end
end
