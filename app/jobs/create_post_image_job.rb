class CreatePostImageJob < ApplicationJob
  queue_as :default

  def perform(post)
    p post.image_temp_url
    post.image = URI.parse(post.image_temp_url)
    saved = post.save!
    user.image_processing = false
    if !saved
      post.destroy
    end
  end
end
