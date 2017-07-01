class User < ApplicationRecord
  after_save :call_avatar_job
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },:path => "avatars/:id/:style/:filename"
  do_not_validate_attachment_file_type :avatar

  has_many :posts


  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable#, :omniauthable
  include DeviseTokenAuth::Concerns::User
  private

  def call_avatar_job
    if self.image_changed?
      self.processed_image=false
      UserAvatarWorker.perform_async(self.id)
    end
  end
end
