class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text,:children_amount,:points,:vote
  has_one :user
  def children_amount
    object.comments.count
  end
  def points
    object.votes.sum(:value)
  end
  def vote
    scope.get_vote_for object
  end
end
