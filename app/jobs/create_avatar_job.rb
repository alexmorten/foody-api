class CreateAvatarJob < ApplicationJob
  queue_as :default

  def perform(user)
    user.avatar = URI.parse(user.image)
    user.processed_image = true
    user.save!

  end
end
