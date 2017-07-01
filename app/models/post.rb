class Post < ApplicationRecord
  after_save :call_image_job

  belongs_to :user
  has_attached_file :image, styles: {large:"900x", medium: "600x>", thumb: "300x300>" },:path => "posts/:id/:style/:filename"
  do_not_validate_attachment_file_type :image

  def call_image_job
    if self.image_temp_url_changed?
      self.image_processing=true
      CreatePostImageJob.perform_later(self)
    end
  end
end
