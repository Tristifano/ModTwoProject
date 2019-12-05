class List < ApplicationRecord
  belongs_to :user
  has_many :movielists
  has_many :movies, through: :movielists
end
