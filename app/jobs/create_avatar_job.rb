class CreateAvatarJob < ApplicationJob
  queue_as :default

  def perform(user)
    user.avatar = URI.parse(user.image)
    # adapter = Paperclip.io_adapters.for(user.avatar)
    # user.avatar_content_type=Paperclip::ContentTypeDetector.new(adapter.path).detect
    user.processed_image = true
    user.save!

  end
end
