class Post < ApplicationRecord
  enum status: { draft: 1, pushlish: 2 }

  belongs_to :topic

  has_many :votes, as: :ownerable, dependent: :destroy

  scope :pushlished, ->{ joins(:votes).where(status: :pushlish).includes(:topic, topic: [:user, :category]) }
  scope :cal_vote, ->{ pushlished.select("posts.*, SUM(votes.status) AS total_vote").group(:id) }
  scope :newest, ->{ cal_vote.order(created_at: :desc) }

  delegate :category, to: :topic
  delegate :user, to: :topic

  class<<self
    def _on context
      case context
      when nil
        newest
      when "newest"
        newest
      when "most_upvote"
        cal_vote.order("total_vote DESC")
      when "on_largest_category"
        Category.largest_category.posts.cal_vote
      else
        newest
      end
    end
  end
end
