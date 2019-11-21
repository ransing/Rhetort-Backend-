class User < ApplicationRecord
has_many :answers
has_many :questions, through: :answers
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    

end
