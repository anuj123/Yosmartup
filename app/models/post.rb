class Post < ActiveRecord::Base
belongs_to :blog
validates_presence_of :title, :body, :blog
end
