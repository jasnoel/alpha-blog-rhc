class User < ActiveRecord::Base

    has_many :articles

    validates :username,    presence: true, 
                            uniqueness: { case_sensitive: false }, 
                            length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /.+\@.+\..+/i
    validates :email,       presence: true, 
                            uniqueness: true, 
                            format: { with: VALID_EMAIL_REGEX }

end