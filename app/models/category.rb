class Category < ApplicationRecord
  has_many :category_managements, dependent: :destroy
  has_many :banning_categories, dependent: :destroy
  has_many :topics, dependent: :destroy
end
