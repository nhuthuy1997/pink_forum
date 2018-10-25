class Topic < ApplicationRecord
  enum status: { pending: 1, active: 2, blocked: 3 }

  belongs_to :user
  belongs_to :category

  has_many :votes, as: :ownerable
end
