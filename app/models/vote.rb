class Vote < ApplicationRecord
  enum value: {down:-1,up:1}
  belongs_to :user
  belongs_to :votable,polymorphic: true

end
