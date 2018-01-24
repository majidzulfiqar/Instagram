class InstagramUser < ApplicationRecord
    
    def self.profile profile_info
      @user_profile = profile_info[:user]
      @UserName = @user_profile.username
      @FullName = @user_profile.full_name
      @Website = @user_profile.website
      @Bio = @user_profile.bio
      @Profile_Pic = @user_profile.profile_picture
      
      instagram_user = InstagramUser.new()
      check_user = InstagramUser.find_by(access_token: @user_profile.access_token)
      if !check_user.present?        
        instagram_user.access_token = @user_profile.access_token
        instagram_user.user_name = @UserName
        instagram_user.full_name = @FullName
        instagram_user.website = @Website
        instagram_user.bio = @Bio
        instagram_user.save!
        instagram_user
      end
      InstagramUser.last
    end
end
