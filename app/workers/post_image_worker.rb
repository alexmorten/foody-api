class PostImageWorker
  include Sidekiq::Worker

  def perform(post_id)
    #p post.image_temp_url
    post = Post.find(post_id)

    post.image = URI.parse(post.image_temp_url)
    saved = post.save!

    if !saved
      post.destroy
    else
        post.image_processing = true
        post.save
    end
  end
end
