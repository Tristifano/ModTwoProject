class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :watchlistmovies, dependent: :destroy
  has_many :movies, through: :watchlistmovies
end
