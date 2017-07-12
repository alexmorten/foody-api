class VoteSerializer < ActiveModel::Serializer
  attributes :id, :votable_type, :votable_id, :value
end
