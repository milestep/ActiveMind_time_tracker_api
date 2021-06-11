class User < ApplicationRecord
    has_secure_password
    has_many :notes, dependent: :destroy

    validates :email, presence: true, length: { minimum: 5}
    validates :firstname, presence: true, length: { minimum: 3 }
    validates :lastname, presence: true, length: { minimum: 3 }
    validates :password, presence: true, length: { minimum: 6 }

end
