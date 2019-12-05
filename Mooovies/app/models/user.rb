class User < ApplicationRecord

    has_many :reviews, dependent: :destroy
    has_many :movies, through: :reviews
    has_many :lists

    has_secure_password
    validates :username, presence: true, uniqueness: true

end
