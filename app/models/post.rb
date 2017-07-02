class Post < ApplicationRecord
  after_save :react_to_url_change

  belongs_to :user
  has_many :comments, as: :commentable

  has_attached_file :image, styles: {large:"900x", medium: "600x>", thumb: "300x300>" },:path => "posts/:id/:style/:filename"
  do_not_validate_attachment_file_type :image

  def react_to_url_change
    if self.image_temp_url_changed?
      perform_processing
    end
  end
  def perform_processing

    PostImageWorker.perform_async(self.id)
  end
end
