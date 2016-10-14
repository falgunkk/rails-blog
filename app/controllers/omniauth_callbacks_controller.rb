class OmniauthCallbacksController < Devise::OmniauthCallbacksController
def all
	user=User.from_omniauth(request.env["omniauth.auth"])

	if user.persisted?
		sign_in_and_redirect user, notice: "signed in"
	else
		session["devise.user_attributes"] = user.attributes
		redirect_to new_article_path
		#redirect_to new_article_path
	end
end
alias_method :google_oauth2, :all
end
 