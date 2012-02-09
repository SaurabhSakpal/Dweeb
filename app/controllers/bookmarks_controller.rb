class BookmarksController < ApplicationController
before_filter :authenticate
layout 'profile'

def show
@user = current_user
@user2 = User.find(params[:id])
end

def edit
@user = current_user
@user2 = User.find(params[:id])
end

def delete
@user = current_user
@bookmark = Bookmark.find(params[:id])
if @bookmark.destroy
flash.now[:notice] = "Bookmark deleted"
redirect_to :controller => 'bookmarks',:action=>'show', :id=> @user.id
end
end

def update
@user = current_user
if @bookmark = @user.bookmarks.create!(params[:bookmark])
s = 'saurabh'
params[:bookmark] = {:user_id => @user.id, :title => s ,:desc => s, :url => 'accepted'}
@user.bookmarks.create!(params[:bookmark])
flash[:notice] = 'BookMark Added'+ @bookmark.desc
redirect_to :controller => 'bookmarks',:action=>'edit', :id=> @user.id
else
flash.now[:error] = "Could not save changes please try after sometime"
render :action => "edit"
end
end

end
