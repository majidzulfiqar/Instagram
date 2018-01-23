class LandingController < ApplicationController
    layout 'application'
    
    def callback
      response = Instagram.get_access_token(params[:code], :redirect_uri => ENV['REDIRECT_URI'])
      session[:response] = response
      redirect_to '/profile'
    end
    
    def profile
      @UserName = session[:response]['user']['username']
      @FullName = session[:response]['user']['full_name']
      @Website = session[:response]['user']['website']
      @Bio = session[:response]['user']['bio']
      @Profile_Pic = session[:response]['user']['profile_picture']
      
      instagram_user = InstagramUser.new()
      instagram_user.access_token = session[:response]['access_token']
      instagram_user.user_name = @UserName
      instagram_user.full_name = @FullName
      instagram_user.website = @Website
      instagram_user.bio = @Bio
      instagram_user.save
    end
end

