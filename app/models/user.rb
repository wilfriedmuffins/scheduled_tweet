# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
    #user can have many twitter

    has_many :twitter_accounts
    has_secure_password

    before_save {self.email.downcase!}
                        
    #rubular forregular expression
    VALID_EMAIL_REGEX = /.+\@.+\..+/i

    validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    format: { with: VALID_EMAIL_REGEX}  
end
