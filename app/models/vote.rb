class Vote < ApplicationRecord
  enum type_of_vote: { down_vote: -1, none: 0, up_vote: 1 }

  belongs_to :user
  belongs_to :ownerable, polymorphic: true
end
