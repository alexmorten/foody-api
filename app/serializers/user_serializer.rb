class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :fullname, :image

  def fullname
    object.firstname+" "+object.lastname
  end
end
