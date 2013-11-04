class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
  	user = User.from_omniauth(request.env["omniauth.auth"])
    
  	if user.persisted?
  		flash.notice = "Congratulations! You're signed in!"
  		sign_in_and_redirect user
  	else
  		#session["devise.user_attributes"] = user.user_attributes
  		flash.notice = "the user was not successfully logged in"
  		redirect_to new_user_registration_path
  	end
  end
end
