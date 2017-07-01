class UserAvatarWorker
  include Sidekiq::Worker

  def perform(user_id)
    #p post.image_temp_url
    user = User.find(user_id)
    user.avatar = URI.parse(user.image)
    user.processed_image = true
    user.save!
  end
end
