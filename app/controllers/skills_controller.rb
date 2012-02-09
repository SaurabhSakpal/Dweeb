class SkillsController < ApplicationController
before_filter :authenticate
layout 'profile'

def update
@user = current_user
str = params[:skill]['skl'].split(',')
str.each do |s|
params[:skill] = {:user_id => @user.id, :name => s }
@skill = @user.skills.create!(params[:skill])
end
flash[:notice] = 'Skills Added'
redirect_to :controller => 'profiles', :action=>'show', :id=> @user.id 
end

def show
@user = current_user
@user2 = User.find(params[:id])
end

def delete
@user = current_user
@skill = Skill.find(params[:id])
if @skill.destroy
flash[:notice] = 'Skill Deleted'
redirect_to :controller => 'profiles', :action=>'show', :id=> @user.id 
else
flash[:notice] = 'Unable to Delete Interest'
redirect_to :controller => 'profiles', :action=>'show', :id=> @user.id 
end 
end

end
