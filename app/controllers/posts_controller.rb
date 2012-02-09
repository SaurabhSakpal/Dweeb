class PostsController < ApplicationController
before_filter :authenticate
layout 'profile'

def show
@user = current_user
@user2 = User.find(params[:id])
tag = []
j = 0
@user.interests.each do |i|
tag[j] = i.name
j = j+1
end
j = 0
k = []
tag.each do |t|
if k[j] = Tag.find_by_name(t)
j = j+1 
end
end
@tag = k
end

def createpost
@user = current_user
@user2 = User.find(params[:id])
end

def update
@user = current_user
p = params[:post]['title']
q = params[:post]['body']
tags = params[:post]['tag'].split(',')
params[:update] = {:user_id => @user.id , :title => p , :body=> q }
if @post = @user.posts.create!(params[:update])
tags.each do |t|
if @tag = Tag.find_by_name(t)
@tag.posts << @post
else
params[:tag] = {:name => t }
@tag = Tag.create!(params[:tag])
@tag.posts << @post
end
end
flash.now[:notice] = "sucessfull posted" +p+" "+q
redirect_to :controller => 'posts', :action=>'selfshow', :id=> @user.id
else
flash.now[:notice] = "unable to post"
redirect_to :controller => 'posts', :action=>'createpost', :id=> @user.id 
end
end

def selfshow
@user = current_user
@user2 = User.find(params[:id])
@post  = @user.posts 
end

def delete
@user = current_user
@post = Post.find(params[:id])
@post.destroy
flash.now[:notice] = "sucessfull posted"
redirect_to :controller => 'posts', :action=>'selfshow', :id=> @user.id
end

end
