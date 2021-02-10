class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end   
    
    def create
        #parameters: {"authenticity_token"=>"[FILTERED]", "user"=>{"email"=>"", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign Up"}
        #render plain: params

        # aff{"email"=>"", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
        #render plain: params[:user]

        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "successfully created account"
        else
            flash[:alert] = "something wrong"
            render :new
        end    
    end
    
    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
    
end