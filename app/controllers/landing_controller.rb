class LandingController < ApplicationController
    layout 'layout'
    
    def callback
      response = Instagram.get_access_token(params[:code], :redirect_uri => ENV['REDIRECT_URI'])
      session[:response] = response
      @user_profile = InstagramUser.profile response
      session[:user_profile] = @user_profile
      session[:user_image] = response[:user][:profile_picture]
      if !session[:user_image].nil?
        redirect_to '/profile'
      else
        redirect_to root_path  
      end
    end
    
    def profile
      if session[:user_image].nil?
            redirect_to root_path  
      end
    end
    
    
    def logout
        session[:response] = nil
        session[:user_profile] = nil
        session[:user_image] = nil
        redirect_to root_path  
    end
end

