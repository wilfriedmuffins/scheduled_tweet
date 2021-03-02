class ApplicationController < ActionController::Base
#avant chauqe action set_current_usersera exercuté
before_action :set_current_user


    #action see for all controller
    def set_current_user
        if session[:user_id]
            Current.user= User.find_by(id: session[:user_id])
        end
    end

    #if user no connected redirect to root with alert
    def require_user_logged_in!
        redirect_to sign_in_path, alert: "You must be signed in to do that." if Current.user.nil?
    end
end
