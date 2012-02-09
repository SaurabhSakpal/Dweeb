class UsersController < ApplicationController
layout 'welcome'
 
def homepage
@user = User.new
end

def create 

if @user = User.create(params[:user])
UserMailer.mail_sender(@user).deliver
flash[:notice] = 'Verification mail has been sent'
redirect_to :controller=> 'users', :action=> 'homepage'
else
arr = @user.errors.full_messages
str = ''
arr.each do |a|
str = str +' '+ a
end
flash[:notice] = str 
redirect_to :controller=> 'users', :action=> 'homepage'
end
end 

def verify
@user = User.find(params[:id])
@user.validate = 'true'
if @user.save
flash[:notice] = "Email verified"
redirect_to :controller=> 'users', :action=> 'homepage'
else
flash[:notice] = "Email can't be verified"
redirect_to :controller=> 'users', :action=> 'homepage'
end
end
end
