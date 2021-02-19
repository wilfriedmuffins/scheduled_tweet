class ApplicationController < ActionController::Base
#avant chauqe action set_current_usersera exercuté
before_action :set_current_user


    #action see for all controller
    def set_current_user
        if session[:user_id]
            Current.user= User.find_by(id: session[:user_id])
        end
    end

end
