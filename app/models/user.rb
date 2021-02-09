# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
    has_secure_password

                        
    #rubular forregular expression
    VALID_EMAIL_REGEX = /.+\@.+\..+/i

    validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    format: { with: VALID_EMAIL_REGEX}  
end
