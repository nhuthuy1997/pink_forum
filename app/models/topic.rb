class Topic < ApplicationRecord
  enum status: { pending: 1, active: 2, blocked: 3 }

  belongs_to :user
  belongs_to :category

  has_many :posts, dependent: :destroy
  has_many :votes, as: :ownerable, dependent: :destroy

  scope :most_upvote, ->(page){ pushlished.joins(:votes).select("topic.*, SUM(votes.status) AS total_vote").group(:id).order("total_vote DESC").limit(page) }
end
