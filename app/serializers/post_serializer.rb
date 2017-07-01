class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image_processing, :ingredients, :preparation,:image_thumb,:image_medium,:image_large,:image_original
  belongs_to :user
  def image_thumb
    object.image.url(:thumb)
  end
  def image_medium
    object.image.url(:medium)
  end
  def image_large
      object.image.url(:large)
  end
  def image_original
      object.image.url(:original)
  end
end
