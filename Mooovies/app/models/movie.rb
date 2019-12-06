class Movie < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews
    has_many :movielists, dependent: :destroy
    has_many :lists, through: :movielists
    has_many :watchlistmovies, dependent: :destroy
    has_many :watchlists, through: :watchlistmovies
    serialize :properties, Hash
end
