class User < ApplicationRecord
  enum sex: { male: 0, female: 1 }
  enum role: { admin: 1, moderator: 2, normal: 3 }

  has_many :votes
  has_many :banning_categories, dependent: :destroy
  has_many :category_managements, ->{ where(role: :moderator) }
  has_many :topics, dependent: :destroy
end
