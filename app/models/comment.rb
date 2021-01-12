class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :fashion

  validates :text, presence: true
end
