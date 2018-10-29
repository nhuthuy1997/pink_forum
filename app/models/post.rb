class Post < ApplicationRecord
  enum status: { draft: 1, pushlish: 2 }

  belongs_to :topic

  has_many :votes, as: :ownerable, dependent: :destroy

  scope :pushlished, ->{ where status: :pushlish }
  scope :most_upvote, ->(page){ pushlished.joins(:votes).select("posts.*, SUM(votes.status) AS total_vote").group(:id).order("total_vote DESC").limit(page) }
  scope :newest, ->(page){ pushlished.order(created_at: :desc).limit(page) }

  class<<self
    def _on context, page
      case context
      when nil
        newest page
      when "newest"
        newest page
      when "post-most-upvote"
        most_upvote page
      else

      end
    end
  end
end
