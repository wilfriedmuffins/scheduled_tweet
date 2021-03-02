class OmniauthCallbacksController < ApplicationController
    def twitter
        #check if account already exit if no create ou if yes update
        twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
        twitter_account.update(
            name: auth.info.name,
            image: auth.info.image,
            token: auth.credentials.token ,
            secret: auth.credentials.secret,
        ) 

        redirect_to twitter_accounts_path, notice: "successfully connected your account"
    end

    def auth
        request.env['omniauth.auth']
        
    end
    
end