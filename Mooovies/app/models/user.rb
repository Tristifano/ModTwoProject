class User < ApplicationRecord
    has_secure_password

    has_many :reviews, dependent: :destroy
    has_many :movies, through: :reviews
    has_many :lists
    
    has_many :comments
    has_one :watchlist

    validates :username, presence: true, uniqueness: true
end
