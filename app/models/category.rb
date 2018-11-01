class Category < ApplicationRecord
  has_many :category_managements, dependent: :destroy
  has_many :banning_categories, dependent: :destroy
  has_many :topics, dependent: :destroy

  scope :most_category, ( lambda do |page, current_user|
    pushlished.joins(:votes).select("topic.*, SUM(votes.status) AS total_vote")
      .group(:id).order("total_vote DESC").limit(page) if banning?(current_user)
  end)

  def banning? current_user
    banning_categories.where(user: current_user)
  end
end
