class Vote < ApplicationRecord
  enum status: { down_vote: -1, none: 0, up_vote: 1 }, _suffix: true

  belongs_to :user
  belongs_to :ownerable, polymorphic: true
end
