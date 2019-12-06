class List < ApplicationRecord
  belongs_to :user
  has_many :movielists, dependent: :destroy
  has_many :movies, through: :movielists
  has_one_attached :avatar, dependent: :destroy
end
