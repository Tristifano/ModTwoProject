class Movie < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews
    has_many :movielists
    has_many :lists, through: :movielists
    serialize :properties, Hash
end
