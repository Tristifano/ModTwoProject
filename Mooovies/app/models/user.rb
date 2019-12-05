class User < ApplicationRecord
    has_secure_password

    has_many :reviews, dependent: :destroy
    has_many :movies, through: :reviews
    has_many :lists

    validates :username, presence: true, uniqueness: true

end
