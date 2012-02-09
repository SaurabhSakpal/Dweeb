class ProfilesController < ApplicationController
before_filter :authenticate
layout 'profile'
def show
@user = current_user
@user2 = User.find(params[:id]) 
end

def edit
@user = current_user
@user2 = User.find(params[:id])
if @user.id != @user2.id
redirect_to :controller => 'profiles',:action=>'show', :id=> @user2.id
end
end

def update
@user = current_user
if @user.update_attributes(params[:user])
flash[:notice] = 'Profile Updated'
redirect_to :controller => 'profiles',:action=>'show', :id=> @user.id
else
flash.now[:error] = "Could not save changes please try after sometime"
render :action => "edit"
end
end

end
