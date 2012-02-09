class User < ActiveRecord::Base

has_many :messages
has_many :interests
has_many :skills
has_many :bookmarks
has_many :posts

has_attached_file :photo,:url=>"/assets/images/pfpic/:id/:basename.:extension",
                  :path=>":rails_root/app/assets/images/pfpic/:id/:basename.:extension"
validates :email, :presence => true
validates :password, :presence => true
validates :fname, :presence => true
validates :lname, :presence => true
validates :password, :length => { :in => 6..30 }
validates :email, :uniqueness => true
validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 2.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
