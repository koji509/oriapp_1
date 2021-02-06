class Fashion < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  validates :artist, presence: true
  validates :brand,  presence: true
  validates :item,   presence: true
  validates :image,  presence: true
end