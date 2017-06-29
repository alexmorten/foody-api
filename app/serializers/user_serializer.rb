class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :fullname, :image,:avatar_thumb,:avatar_medium

  def fullname
    object.firstname+" "+object.lastname
  end
  def avatar_thumb
    object.avatar.url(:thumb)
  end
  def avatar_medium
    object.avatar.url(:medium)
  end
end
