class InterestsController < ApplicationController
before_filter :authenticate
layout 'profile'

def update
@user = current_user
str = params[:interest]['intr'].split(',')
str.each do |s|
params[:interest] = {:user_id => @user.id, :name => s }
@interest = @user.interests.create!(params[:interest])
end
flash[:notice] = 'Interests Added'
redirect_to :controller => 'interests', :action=>'show', :id=> @user.id 
end

def show
@user = current_user
@user2 = User.find(params[:id])
end

def delete
@user = current_user
@interest = Interest.find(params[:id])
if @interest.destroy
flash[:notice] = 'Interests Deleted'
redirect_to :controller => 'profiles', :action=>'show', :id=> @user.id 
else
flash[:notice] = 'Unable to Delete Interest'
redirect_to :controller => 'profiles', :action=>'show', :id=> @user.id 
end 
end

end
