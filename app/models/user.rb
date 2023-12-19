class User < ApplicationRecord
  self.per_page = 5
  validates :email, presence: true
  has_many :images, as: :imagable
  has_many :articles

  default_scope { order(id: :desc) }
end
