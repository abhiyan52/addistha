class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :username
    validates_presence_of :first_name
    validates_presence_of :last_name
    validates_presence_of :email 
    validates_presence_of :contact_number
    validates_presence_of :username
end
