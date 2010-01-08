class AddBlogNameBlogId < ActiveRecord::Migration
  def self.up
      add_column :blogs, :name, :string
  end

  def self.down
     remove_column :blogs, :name
  end
end
