class Topic < ApplicationRecord
  enum status: { pending: 1, active: 2, blocked: 3 }

  belongs_to :user
  belongs_to :category

  has_many :posts, dependent: :destroy
  has_many :votes, as: :ownerable, dependent: :destroy

  scope :most_upvote, -> { joins(:votes).select("topics.*, SUM(votes.status) AS total_vote_topic").group(:id).order("total_vote_topic DESC") }
end
