class CategoryManagement < ApplicationRecord
  belongs_to :user, as: :moderator
  belongs_to :category
end
