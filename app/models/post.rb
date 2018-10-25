class Post < ApplicationRecord
  enum status: { draft: 1, pushlish: 2 }

  belongs_to :series

  has_many :votes, as: :ownerable
end
