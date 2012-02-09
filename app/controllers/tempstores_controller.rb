class TempstoresController < ApplicationController
layout 'login'

def new
@tempstore = Tempstore.new
end

def login
if @tempstore = Tempstore.create(params[:tempstore])
@user = User.find_by_email(@tempstore.email)
passwrd1 = @user.password
passwrd2 = @tempstore.password
if @user.validate == nil
@tempstore.destroy
flash[:notice] = "Verify your email first "
redirect_to :controller => 'tempstores',:action=>'new'
else
if passwrd1 == passwrd2  
session[:user_id] = @user.id
@tempstore.destroy
redirect_to :controller => 'profiles',:action=>'show', :id=>@user.id
flash[:notice] = "successfully logged in"
else
@tempstore.destroy
redirect_to :controller => 'tempstores',:action=>'new'
flash[:notice] = "Invalid user name/password"
end
end
else
reset_session
flash[:notice] = "Unable to login please try after sometime"
redirect_to :controller => 'tempstores',:action=>'new'
end
end


def logout
session[:user_id] = nil
reset_session
flash[:notice] = "Successfully LogedOut"
redirect_to :controller => 'tempstores',:action=>'new'
end
end
