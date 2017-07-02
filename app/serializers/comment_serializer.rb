class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text,:children_amount
  has_one :user
  def children_amount
    object.comments.count
  end
end
