class CategoryManagement < ApplicationRecord
  belongs_to :moderator, class_name: "User"
  belongs_to :category
end
