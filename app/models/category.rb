class Category < ApplicationRecord
  has_many :category_managements, dependent: :destroy
  has_many :banning_categories, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :posts, through: :topics

  scope :most_category, ( lambda do | current_user|
    pushlished.joins(:votes).select("topic.*, SUM(votes.status) AS total_vote")
      .group(:id).order("total_vote DESC") if banning?(current_user)
  end)

  scope :largest_category, ->{ joins(:topics, topics: :posts).select("categories.*, COUNT(*) AS total_posts").group(:id).having("total_posts = MAX(total_posts)").first }

  def banning? current_user
    banning_categories.where(user: current_user)
  end
end
