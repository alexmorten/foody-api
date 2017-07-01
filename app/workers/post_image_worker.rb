class PostImageWorker
  include Sidekiq::Worker

  def perform(post_id)
    #p post.image_temp_url
    post = Post.find(post_id)
    post.image = URI.parse(post.image_temp_url)
    saved = post.save!
    post.image_processing = false
    if !saved
      post.destroy
    end
  end
end
