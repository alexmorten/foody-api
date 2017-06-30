class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :fullname, :image,:avatar_thumb,:avatar_medium,:avatar_original

  def fullname
    object.firstname+" "+object.lastname
  end
  def avatar_thumb
    object.avatar.url(:thumb)
  end
  def avatar_medium
    object.avatar.url(:medium)
  end
  def avatar_original
      object.avatar.url(:original)
  end
end
