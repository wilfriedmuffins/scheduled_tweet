class TwitterAccountsController < ApplicationController
    before_action :require_user_logged_in!

    
    before_action :set_twitter_account, only: [:destroy]


    def index
        #creation d'une variable d'instence
        @twitter_accounts = Current.user.twitter_accounts
    end

    def destroy
        #Current.user.twitter_accounts = récupère l'associaion des compte twiter utilisateur
        #find(params[:id]) trouve l'id de l'user conecter
        
        @twitter_account.destroy
        redirect_to twitter_accounts_path, notice: "successfully deconnected @#{twitter_account.username}"
    end

    private

    def set_twitter_account
        @twitter_account = Current.user.twitter_accounts.find(params[:id])
    end
end