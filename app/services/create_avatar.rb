
class CreateAvatar



  def initialize(user)
    @user = user

  end

  # @return [Boolean] Document saved
  def call
    queue_process
  end

  private



  def queue_process

    CreateAvatarJob.perform_later(@user)
  end

end
