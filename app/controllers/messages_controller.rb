class MessagesController < ApplicationController
before_filter :authenticate
layout 'profile'

def show
@user = current_user
@user2 = User.find(params[:id])
@messages = @user.messages
params[:message] = {:status => 'read'}
@messages.each do |m|
m.update_attributes(params[:message])
end
end

def delete
@user = current_user
@message = Message.find(params[:id])
if @message.destroy
flash.now[:notice] = "Message deleted"
redirect_to :controller => 'messages',:action=>'show', :id=> @user.id
end
end

def connect
@user = current_user
@user2 = User.find(params[:id]) 
end

def create
@user = current_user
@user2 = User.find(params[:id])
k = params[:message]['msg']
p = params[:message]['skl']
sub = params[:message]['sub']
@skill = @user2.skills
flag = 0
str =''
@skill.each do |a|
if p == a.name
flag = 1;
str = str + a.name
break;
end
end
if flag ==1
params[:message] = {:user_id => @user2.id, :sender => @user.id, :msg => k ,:status => 'unread',:subject=> sub }
if @message = @user2.messages.create!(params[:message])
flash[:notice] = 'Message Sent'
redirect_to :controller => 'messages',:action=>'connect', :id=> @user2.id
else
flash[:notice] = 'Unable to send Message'
redirect_to :controller => 'messages',:action=>'connect',:id=>@user2.id
end
else
flash[:notice] = 'Skill entered is wrong'+' '+p+' '+str
redirect_to :controller => 'messages',:action=>'connect',:id=>@user2.id
end
end

end
