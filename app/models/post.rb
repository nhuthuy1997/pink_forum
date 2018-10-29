class Post < ApplicationRecord
  enum status: { draft: 1, pushlish: 2 }

  belongs_to :topic

  has_many :votes, as: :ownerable

  scope :most_upvote, (lambda do 
    
  end)
end
