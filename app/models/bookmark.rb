class Bookmark < ActiveRecord::Base
belongs_to :user

validates :desc, :presence => true
validates :title, :presence => true
validates :url, :presence => true
end
