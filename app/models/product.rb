class Product < ApplicationRecord
  has_many :images, as: :imagable
end
